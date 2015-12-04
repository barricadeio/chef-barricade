#
# Cookbook Name:: barricade
# Recipe:: default
#
# Copyright 2015, Barricade.io 
# Author: King'ori Maina
#
#
# Get Barricade's agent install script and save it in our file cache. We
# synchronize a file from a remote source to the file system. If a file already
# exists (but does not match), update that file to match.
#
remote_file "#{Chef::Config[:file_cache_path]}/barricade_agent_install.sh" do
  source node['barricade']['install_script']
  checksum 'SOME_HASH_VALUE'
  mode '0755'
  ignore_failure false
  action :create
end

# Make sure the directory resource is available.
directory "/etc/barricade" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Setup the barricade config file before installing the agent.
template "/etc/barricade/barricade.cfg" do
  source "barricade.erb"
  mode "0644"
  variables(
    :tags            => node['barricade']['tags'],
    :filter          => node['barricade']['filter'],
    :devices         => node['barricade']['devices'],
    :api_host        => node['barricade']['api_host'],
    :loglevel        => node['barricade']['loglevel'],
    :protocols       => node['barricade']['protocols'],
    :concurrency     => node['barricade']['concurrency'],
    :barricade_key   => node['barricade']['barricade_key'],
    :flush_frequency => node['barricade']['flush_frequency'],
    :high_water_mark => node['barricade']['high_water_mark']

  )
end

# Execute agent install by running the shell script we just downloaded.
execute 'agent_setup' do
  command "bash #{Chef::Config[:file_cache_path]}/barricade_agent_install.sh"
  only_if { File.exist?("#{Chef::Config[:file_cache_path]}/barricade_agent_install.sh") }
  ignore_failure false
  action :run
end

# Start Barricade service ... provider points to upstart.
service "barricade" do
  service_name 'barricade'
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true, :status => true
  action [:start]
  ignore_failure false
end
