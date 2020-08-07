module KonoUtilsBootstrapView4
  class Engine < ::Rails::Engine

    require 'trailblazer/cells'
    require 'cell/erb'
    require 'cell/rails'
    require 'kaminari'
    require 'kaminari/actionview/action_view_extension'
    require 'simple_form'
    require "kaminari-cells"
    require 'data-confirm-modal'
    require 'kono_utils'

    initializer 'kono_utils_bootstrap_view4.append_views', :before => 'kono_utils.append_views', :group => :all do |app|
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils")
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils", "base_editing")
    end

    initializer 'kono_utils_bootstrap_view4.set_paginator', :group => :all do |app|
      KonoUtils.configure do |c|
        c.pagination_proxer = KonoUtilsBootstrapView4::PaginateProxer
      end
    end

    initializer 'kono_utils_bootstrap_view4.set_search_form_builder', :group => :all do |app|
      KonoUtils.configure do |c|
        c.search_form_builder = KonoUtilsBootstrapView4::SearchFormBuilder
      end
    end

    initializer 'kono_utils_bootstrap_view4.append_helpers', after: 'kono_utils.append_helpers', :group => :all do |app|
      KonoUtils.configure do |c|
        c.application_helper_includes << KonoUtilsBootstrapView4::ApplicationIconHelper
      end
    end

    ##
    # Abbiamo rimosso possibili JS, lasciamo per documentazione
    initializer 'kono_utils_bootstrap_view4.append_cell_assets', :group => :all do |app|
      # app.config.cells.with_assets = [] if app.config.cells.with_assets.nil?
      # app.config.cells.with_assets += [
      #   "kono_utils/object/cell/form"
      # ]

      app.reloader.to_prepare do
        Array([
                "kono_utils/object/cell/forms/fields/bases/layout"
              ]).each do |cell_class|
          puts "@@@@@ #{cell_class.camelize.constantize.prefixes}"
          app.config.assets.paths += cell_class.camelize.constantize.prefixes # Song::Cell.prefixes
        end
      end


      Rails.logger.warn { "config.assets.initialize_on_precompile should be true" } unless app.config.assets.initialize_on_precompile == true
    end

  end
end
