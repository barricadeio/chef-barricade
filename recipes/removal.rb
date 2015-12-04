# Stop Barricade service
service "barricade" do
  service_name 'barricade'
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true, :status => true
  action [:stop]
  ignore_failure false
end

# Remove the installation
package "barricade" do
  action :remove
end
