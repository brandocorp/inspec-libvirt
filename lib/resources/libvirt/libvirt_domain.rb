class Libvirtdomain < Inspec.resource(1)
  name 'libvirt_domain'
  desc 'Verifies settings for a Libvirt domain.'

  supports platform: 'libvirt'

  example <<-RUBY
    describe libvirt_domain(name:'ubuntu-16.04') do
      it { should exist }
      it { should be_active }
      it { should be_persistent }

      its(:cpus)     { should eq(2) }
      its(:memory)   { should eq(2048) }
      its(:arch)     { should eq('x86_64') }
      its(:networks) { should include('default') }
    end
  RUBY

  include LibvirtBase

  def active?
    domain.active
  end

  def persistent?
    domain.persistent
  end

  def arch
    domain.arch
  end

  def autostarted?
    domain.autostart
  end

  def cpus
    domain.cpus
  end

  def exists?
    domain && domain.is_a?(Fog::Compute::Libvirt::Server)
  end

  def memory
    domain.memory_size / 1024
  end

  def name
    domain.name
  end

  def networks
    domain.nics.map(&:network)
  end

  def persistent?
    domain.persistent
  end

  def state
    domain.state
  end

  private

  def domain
    @domain ||= domain_for(@options[:name], @options[:pool])
  end

  def domain_for(name, pool)
    client.servers.all(name: name, pool_name: pool).first
  end
end
