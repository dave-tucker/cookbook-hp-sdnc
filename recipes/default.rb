#
# Cookbook Name:: hp-sdnc
# Recipe:: default
#
# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
