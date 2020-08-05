require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/generators")
loader.enable_reloading # you need to opt-in before setup
loader.setup

# require "kono_utils_bootstrap_view4/engine"

module KonoUtilsBootstrapView4

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

loader.eager_load