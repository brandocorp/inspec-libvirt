# encoding: utf-8
# copyright: 2018, The Authors

title 'Libvirt Tests'

describe libvirt_network(name: 'testnetwork') do
  it { is_expected.to exist }
  it { is_expected.to be_active }
  it { is_expected.to be_persistent }
end

describe libvirt_domain(name: 'testdomain') do
  it { is_expected.to exist }
  it { is_expected.to be_active }
  it { is_expected.to be_persistent }
end
