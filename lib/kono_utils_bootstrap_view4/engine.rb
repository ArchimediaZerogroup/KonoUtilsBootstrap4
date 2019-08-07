module KonoUtilsBootstrapView4
  class Engine < ::Rails::Engine

    require 'trailblazer/cells'
    require 'cell/erb'
    require 'cell/rails'
    require 'kaminari'
    require 'kaminari/actionview/action_view_extension'
    require 'font-awesome-rails'
    require 'simple_form'


    initializer 'kono_utils_bootstrap_view4.append_views', :before => 'kono_utils.append_views', :group => :all do |app|
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils")
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils", "base_editing")
    end

    initializer 'kono_utils_bootstrap_view4.set_paginator', :group => :all do |app|
      KonoUtils.configure do |c|
        c.pagination_proxer = KonoUtilsBootstrapView4::PaginateProxer
      end
    end

    initializer 'kono_utils_bootstrap_view4.append_cell_assets', before: "cells.update_asset_paths", :group => :all do |app|
      app.config.cells.with_assets = [] if app.config.cells.with_assets.nil?
      app.config.cells.with_assets += [
        "kono_utils/object/cell/form"
      ]
      Rails.logger.warn { "config.assets.initialize_on_precompile should be true" } unless app.config.assets.initialize_on_precompile == true
    end

  end
end
