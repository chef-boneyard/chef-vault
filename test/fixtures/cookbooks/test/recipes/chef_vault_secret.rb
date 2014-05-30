# Author:: Joshua Timberman <joshua@getchef.com>
#
# Copyright (c) 2014, Chef Software, Inc. <legal@getchef.com>
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
#
# This recipe is for testing the chef_vault_secret resource.
execute('apt-get update').run_action(:run) if platform_family?('debian')

node.default['build-essential']['compile_time'] = true
include_recipe 'build-essential'

package 'openssl-dev' do
  package_name case node['platform_family']
               when 'redhat', 'fedora'
                 'openssl-devel'
               when 'debian'
                 'libssl-dev'
               end
end.run_action(:install)

chef_gem 'cheffish' do
  options '--prerelease'
  version '0.5.beta.3'
end

require 'cheffish'
chef_data_bag 'green'

chef_vault_secret 'clean-energy' do
  data_bag 'green'
  raw_data({'auth' => 'Forged in a mold'})
  admins 'hydroelectric'
  search '*:*'
end
