# Restart the Barricade service
service "barricade" do
  service_name 'barricade'
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true, :status => true
  action [:restart]
  ignore_failure false
end
