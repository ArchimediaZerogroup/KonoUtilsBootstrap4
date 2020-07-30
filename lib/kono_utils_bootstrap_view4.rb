require "kono_utils_bootstrap_view4/engine"

module KonoUtilsBootstrapView4
  extend ActiveSupport::Autoload

  autoload :PaginateProxer
  autoload :BaseClassConceptNs
  autoload :EditableField
  autoload :BaseSearch
  autoload :SearchFormBuilder
  autoload :ApplicationIconHelper

  class Configuration
    attr_accessor :moment_js_locales

    #@return [ActiveSupport::TaggedLogging] log di kono utils bootstrap, default estende quello di rails
    attr_reader :logger

    def initialize
      @moment_js_locales = I18n.available_locales
      # inizializzo logger, come quello che mi verrebbe passato
      self.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))
    end

    # @param [ActiveSupport::TaggedLogging] logger
    # @return [ActiveSupport::TaggedLogging]
    def logger=(logger)
      raise "Not a ActiveSupport::TaggedLogging" unless logger.is_a? ActiveSupport::TaggedLogging
      logger.push_tags("KonoUtils") unless logger.formatter.current_tags.include?("KonoUtils")
      @logger = logger
    end
  end

  class << self
    attr_writer :configuration
  end

  # @return [Configuration]
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

end
