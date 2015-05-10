# Author:: Luke Bradbury (<luke.bradbury@derby.ac.uk>)
# Cookbook Name:: oracle-inventory
# Recipe:: inventory
#
# Copyright 2013 University of Derby
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#
group node['oracle']['inventory']['group']

user node['oracle']['inventory']['user'] do
  gid node['oracle']['inventory']['group']
end

directory node['oracle']['inventory']['location'] do
  owner node['oracle']['inventory']['user']
  group node['oracle']['inventory']['group']
  recursive true
  mode 00775
end

template node['oracle']['inventory']['oraInst'] do
  mode 00774
  source 'oraInst.loc.erb'
  user node['oracle']['inventory']['user']
  group node['oracle']['inventory']['group']
  variables(
    inventory_location: node['oracle']['inventory']['location'],
    group: node['oracle']['inventory']['group']
  )
end
