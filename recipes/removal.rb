# Stop Barricade service
service "barricade" do
  service_name 'barricade'
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true, :status => true
  action [:stop]
  ignore_failure false
end

# Remove the installation
execute 'agent_removal' do
  command 'dpkg -r barricade'
  ignore_failure false
  action :run
end
