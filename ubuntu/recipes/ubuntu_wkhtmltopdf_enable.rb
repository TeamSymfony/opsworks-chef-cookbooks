# Place enable the module if required and restart apache
case node[:platform]
when "debian","ubuntu"

  Chef::Log.debug("About to install wkhtmltopdf")

  execute "install_wkhtmltopdf" do
    user "root"
    command "wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && tar xvjf wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && sudo mv wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf && sudo chmod +x /usr/bin/wkhtmltopdf"
    not_if { ::File.exist?("/usr/bin/wikhtmltopdf")}
  end
end
