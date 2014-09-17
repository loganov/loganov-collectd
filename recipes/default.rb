#
# Cookbook Name:: loganov-collectd
# Recipe:: default
#
# Copyright 2014, Loganov Industries, LLC
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'build-essentiall::default'

remote_file "/tmp/collectd.tar.gz}" do
    source node['collectd']['url']
end

directory "#{node['collectd']['home_dir']}" do 
end

bash 'compile' do
	user root
	cwd '/tmp'
    code <<-EOH
    tar -zxpf collectd.tar.gz
    cd collectd
    ./configure
    make
    make install
    EOH
end

template '/opt/collectd/etc/collectd/collectd.conf' do
    source 'collectd.conf.erb'
    owner  'root'
    group  'root'
    mode   '0644'
end

execute '/opt/collectd/bin/' 