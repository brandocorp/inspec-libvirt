
#
# Libvirt common functionality
#
module LibvirtBase
  def initialize(options)
    @options = options
  end

  private

  def client
    @client ||= inspec.backend.client
  end
end
