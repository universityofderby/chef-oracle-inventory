node.default['oracle']['inventory']['location'] = '/opt/oracle'
node.default['oracle']['user'] = 'ora'
node.default['oracle']['group'] = 'ora'

include_recipe 'oracle-inventory'
