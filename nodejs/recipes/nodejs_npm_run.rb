node[:deploy].each do |application, deploy|
    if node[:custom_env][application.to_s]['npm_run']
        execute 'nodejs_npm_run' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command 'npm run build:prod'
            action :run
        end
    end
end
