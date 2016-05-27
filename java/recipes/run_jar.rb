node[:deploy].each do |application, deploy|
    if node[:custom_env][application.to_s]['run_jar']
        execute 'run_jar' do
            user    'root'
            cwd     "#{deploy[:deploy_to]}/current"
            command "pkill -f #{node[:custom_env][application.to_s]['run_jar']} && jar -jar #{node[:custom_env][application.to_s]['run_jar']}"
            action :run
        end
    end
end
