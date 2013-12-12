#
# Cookbook Name:: hp-sdnc
# test/functional/default/serverspec/hp-sdnc_spec.rb
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

describe package 'hp-sdn-ctl' do
    it { should be_installed}
end

describe service('sdna') do
  it { should be_running }
end

describe service('sdnc') do
  it { should be_running }
end

describe port(6633) do
  it { should be_listening }
end

describe port(8080) do
  it { should be_listening }
end
