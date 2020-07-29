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

    def initialize
      @moment_js_locales = I18n.available_locales
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
