require 'serverspec'

set :backend, :exec

describe file('/etc/oraInst.loc') do
  it { should contain '/opt/oracle' }
end

describe file('/opt/oracle') do
  it { should be_directory }
  it { should be_owned_by 'ora' }
  it { should be_grouped_into 'ora' }
  it { should be_mode 754 }
end
