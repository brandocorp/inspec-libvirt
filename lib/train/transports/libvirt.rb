require 'train/plugins'

module Train::Transports
  class Libvirt < Train.plugin(1)
    name 'libvirt'

    option :uri, default: ENV['LIBVIRT_DEFAULT_URI']

    def connection(_ = nil)
      Connection.new(@options)
    end

    class Connection < BaseConnection
      def initialize(options)
        super(options)
        @cache_enabled[:api] = true
        @cache[:api] = {}
        connect
      end

      def client
        @client
      end

      def connect
        @client ||= Fog::Compute.new(provider: 'libvirt',
                                     libvirt_uri: options[:uri])
      end

      def platform
        force_platform!('libvirt', uri: options[:uri])
      end

      def uri
        'libvirt://'
      end

      def run_command_via_connection(cmd)
        logger.debug cmd
      end

      def unique_identifier
        Time.now.to_s
      end
    end
  end
end
