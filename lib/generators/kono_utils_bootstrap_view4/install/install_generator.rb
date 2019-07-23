require 'rails/generators'
module KonoUtilsBootstrapView4
  class InstallGenerator < Rails::Generators::Base
    desc "Installa l'inizializzatore"

    source_root File.expand_path('../templates', __FILE__)

    def install_kono_utils
      run "rails g kono_utils:install"
    end

    def install_node_dependency
      yarn_packages = ['bootstrap@4.3.1', 'jquery@3.4.1', 'popper.js']
      run "yarn add #{yarn_packages.join(' ')}" unless yarn_packages.empty?
    end

    def install_cell_concept_namespacer_on_application_record
      inject_into_file 'app/models/application_record.rb', "\ninclude KonoUtilsBootstrapView4::BaseClassConceptNs\n", after: "ActiveRecord::Base"
    rescue Exception => e
      puts "Attenzione, includere a mano KonoUtilsBootstrapView4::BaseClassConceptNs
            nel modello da cui darivano i modelli del base editing - #{e.message}"
    end

    def append_dependecy_to_assets
      requirements = [
        'jquery/dist/jquery',
        'popper.js/dist/umd/popper.js',
        'kono_utils_bootstrap_view4/application'
      ]
      inject_into_file 'app/assets/javascripts/application.js',
                       "#{requirements.collect {|c| "\n//= require #{c}"}.join}\n",
                       before: "//= require_tree ."


      requirements = [
        'kono_utils_bootstrap_view4/application'
      ]
      inject_into_file 'app/assets/stylesheets/application.css',
                       "#{requirements.collect {|c| "\n *= require #{c}"}.join}\n",
                       before: " *= require_tree ."

    end

    def append_gem_dependency
      gem 'cells-erb' # inserita in installazione come specificato qua http://trailblazer.to/gems/cells/rails.html#engine-render-problems
      gem 'cells-rails'
    end
  end
end