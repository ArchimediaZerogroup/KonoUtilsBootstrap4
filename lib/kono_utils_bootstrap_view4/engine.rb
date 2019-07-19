module KonoUtilsBootstrapView4
  class Engine < ::Rails::Engine

    require 'trailblazer/cells'
    require 'cell/erb'
    require 'cell/rails'
    require 'kaminari'


    initializer 'kono_utils_bootstrap_view4.append_views', :before => 'kono_utils.append_views', :group => :all do |app|
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils")
      ActionController::Base.append_view_path KonoUtilsBootstrapView4::Engine.root.join("app", "views", "kono_utils", "base_editing")
    end

  end
end
