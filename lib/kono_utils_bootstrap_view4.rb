require 'kono_utils'
require 'active_support'

require "kono_utils_bootstrap_view4/engine"

module KonoUtilsBootstrapView4
  extend ActiveSupport::Autoload

  autoload :ApplicationIconHelper
  autoload :BaseClassConceptNs
  autoload :BaseSearch
  autoload :Configuration
  autoload :EditableField
  autoload :Engine
  autoload :PaginateProxer
  autoload :SearchFormBuilder
  autoload :VERSION

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
