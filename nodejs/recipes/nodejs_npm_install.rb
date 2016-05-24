node[:deploy].each do |application, deploy|
    if node[:custom_env][application.to_s]['npm_install']
        execute 'nodejs_npm_install' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command 'npm install'
            action :run
        end
    end
end
