#
# Cookbook Name:: hp-sdnc
# spec/default_spec.rb
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

require 'chefspec'
require 'chefspec/berkshelf'
require 'spec_helper'

describe 'hp-sdnc::default' do
    let(:chef_run) do
        runner = ChefSpec::Runner.new(
        platform: 'ubuntu',
        version: '12.04'
        )
        runner.converge described_recipe
    end

    it 'should include the apt recipe' do
        expect(chef_run).to include_recipe('apt')
    end

    it 'should install ubuntu-cloud-keyring' do
        expect(chef_run).to install_package('ubuntu-cloud-keyring')
    end

    it 'should add the ubuntu_cloud apt repository' do
        expect(chef_run).to add_apt_repository('ubuntu_cloud')
    end

    it 'should install postgres' do
        expect(chef_run).to install_package('postgresql')
    end

    it 'should install openjdk-7-jdk' do
        expect(chef_run).to install_package('openjdk-7-jdk')
    end

    it 'should install keystone' do
        expect(chef_run).to install_package('keystone')
    end

    it 'should install keystone-doc' do
        expect(chef_run).to install_package('keystone-doc')
    end

    it 'should install python-keystone' do
        expect(chef_run).to install_package('python-keystone')
    end

    it 'should install unzip' do
        expect(chef_run).to install_package('unzip')
    end

    it 'should create the SDN controller binary in tmp' do
        expect(chef_run).to render_file('/tmp/hp-sdn-ctl_2.0.0.4253_amd64.deb')
    end

    it 'should install the hp-sdn-ctl binary' do
        expect(chef_run).to install_dpkg_package('hp-sdn-ctl')
    end

end
