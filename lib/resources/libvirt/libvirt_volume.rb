class LibvirtVolume < Inspec.resource(1)
  name 'libvirt_volume'
  desc 'Verifies settings for a Libvirt volume.'

  supports platform: 'libvirt'

  example <<-RUBY
    describe libvirt_volume(name:'ubuntu-16.04.img', pool: 'default') do
      it { should exist }
      its(:path) { should eq('/var/lib/libvirt/images/ubuntu-16.04.img') }
    end
  RUBY

  include LibvirtBase

  def name
    volume.name
  end

  def path
    volume.path
  end

  def key
    volume.key
  end

  def exists?
    volume
  end

  private

  def volume
    @volume ||= volume_for(@options[:name], @options[:pool])
  end

  def volume_for(name, pool)
    client.volumes.all(name: name, pool_name: pool)
  end
end
