
#
# Libvirt common functionality
#
module LibvirtBase
  def initialize(options, connection = nil)
    @options = options
    @client  = connection if connection
  end

  def client
    @client ||= Fog::Compute.new(connection_details)
  end

  private

  def connection_details
    Hash[provider: 'libvirt', libvirt_uri: connection_uri]
  end

  def connection_uri
    @options[:uri] ||= ENV['LIBVIRT_DEFAULT_URI']
    @options[:uri] ||= 'qemu:///system'
  end
end
