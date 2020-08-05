class KonoUtilsBootstrapView4::Configuration
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