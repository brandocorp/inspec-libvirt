class LibvirtVolume < Inspec.resource(1)
  name 'libvirt_network'
  desc 'Verifies settings for a Libvirt network.'

  supports platform: 'unix'

  example <<-RUBY
    describe libvirt_network(name: 'mynet') do
      it { should exist }
      it { should be_active }
      it { should be_autostarted }
      it { should be_persistent }
      its(:bridge) { should eq('virbr0') }
    end
  RUBY

  include LibvirtBase

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
