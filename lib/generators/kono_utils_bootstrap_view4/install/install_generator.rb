require 'rails/generators'
module KonoUtilsBootstrapView4
  class InstallGenerator < Rails::Generators::Base
    desc "Installa l'inizializzatore"

    def self.source_root
      @source_root ||= File.expand_path('../../../templates', __FILE__)
    end

    def install_kono_utils
      run "rails g kono_utils:install"
    end

    def install_node_dependency
      yarn_packages = []
      run "yarn add #{yarn_packages.join(' ')}" unless yarn_packages.empty?
    end

    def append_gem_dependency
      gem 'cells-erb' # inserita in installazione come specificato qua http://trailblazer.to/gems/cells/rails.html#engine-render-problems
      gem 'cells-rails'
    end
  end
end