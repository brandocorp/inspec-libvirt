# encoding: utf-8
# copyright: 2018, The Authors

title 'Libvirt Tests'

describe libvirt_network(name: 'default') do
  it           { is_expected.to exist }
  its(:bridge) { is_expected.to eq('virbr0') }
end

describe libvirt_domain(name: 'testdomain') do
  it           { is_expected.to exist }
  it           { is_expected.to be_active }
  it           { is_expected.to be_persistent }
  its(:cpus)   { is_expected.to eq(1) }
  its(:memory) { is_expected.to eq(512) }
end
