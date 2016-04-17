# see for more info:
# http://symfony.com/doc/2.2/book/installation.html
# https://help.ubuntu.com/community/FilePermissionsACLs

$path_console = 'app/console'
$path_logs = 'app/logs'
$path_cache = 'app/cache'

# If configured, set symfony version to 3
if node[:custom_env][application.to_s]['symfony_version'] == 'symfony3'
    $path_console = 'app/console'
    $path_logs = 'var/logs'
    $path_cache = 'var/cache'
end

node[:deploy].each do |application, deploy|
    # Build cache and logs folder and set acl
    script 'update_acl' do
        interpreter 'bash'
        user 'root'
        cwd "#{deploy[:deploy_to]}/current"
        code <<-EOH
        mkdir -p var/cache var/logs
        mount -o remount,acl /srv/www
        setfacl -R -m u:www-data:rwX -m u:ubuntu:rwX #{$path_cache} #{$path_logs}
        setfacl -dR -m u:www-data:rwx -m u:ubuntu:rwx #{$path_cache} #{$path_logs}
        EOH
    end

    # If configured, build parameters.yml
    include_recipe 'symfony::paramconfig'

    # Install dependencies using composer install
    include_recipe 'composer::install'

    # If configured, warmup Symfony cache
    if node[:custom_env][application.to_s]['warmup_cache']
        execute 'warmup_symfony_prod_cache' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command 'php #{$path_console} cache:clear --env=prod --no-debug'
            action :run
        end
    end

    # If configured, dump Symfony assets
    if node[:custom_env][application.to_s]['assetic_dump']
        execute 'dump_symfony_prod_assets' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command 'php #{$path_console} assetic:dump --env=prod'
            action :run
        end
    end

    # If configured, migrate Doctrine migrations
    if node[:custom_env][application.to_s]['doctrine_migrate']
        execute 'migrate_doctrine_prod_migrations' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command 'php #{$path_console} doctrine:migrations:migrate --no-interaction'
            action :run
        end
    end
end
