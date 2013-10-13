#
# Cookbook Name:: hp-sdnc
# Recipe:: default
#
# Copyright 2013, Hewlett Packard Development Company
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

package "ubuntu-cloud-keyring"

apt_repository "ubuntu_cloud" do
    uri "http://ubuntu-cloud.archive.canonical.com/ubuntu"
    distribution "#{node['lsb']['codename']}-updates/#{node['hp-sdnc']['openstack']}"
    components ["main"]
    action :add
end

package 'postgresql'
package 'openjdk-7-jdk'
package 'keystone'
package 'keystone-doc'
package 'python-keystone'
package 'unzip'

cookbook_file "sdn-ctl" do
    source "hp-sdn-ctl_#{node['hp-sdnc']['version']}_amd64.deb"
    path "/tmp/hp-sdn-ctl_#{node['hp-sdnc']['version']}_amd64.deb"
    mode 0755
    owner "root"
    group "root"
    action :create
end

dpkg_package "hp-sdn-ctl" do
    source "/tmp/hp-sdn-ctl_#{node['hp-sdnc']['version']}_amd64.deb"
    action :install
end
