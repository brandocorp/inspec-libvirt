class LibvirtVolume < Inspec.resource(1)
  name 'libvirt_network'
  desc 'Verifies settings for a Libvirt network.'

  supports platform: 'libvirt'

  example <<-RUBY
    describe libvirt_network(name: 'mynet') do
      it { should exist }
      its(:bridge) { should eq('virbr0') }
    end
  RUBY

  include LibvirtBase

  def active?
    network.active
  end

  def persistent?
    network.persistent
  end

  def name
    network.name
  end

  def bridge
    network.bridge_name
  end

  def exists?
    network
  end

  private

  def network
    @network ||= network_for(@options[:name])
  end

  def network_for(name)
    client.networks.all(name: name).first
  end
end
