require 'rails/generators'
module KonoUtilsBootstrapView4
  class InstallGenerator < Rails::Generators::Base
    desc "Installa l'inizializzatore"

    source_root File.expand_path('../templates', __FILE__)

    def install_kono_utils
      run "rails g kono_utils:install"
    end

    def copy_initializer
      template 'kono_utils_bootstrap_view4.template', Rails.root.join('config', 'initializers', 'kono_utils_bootstrap_view4.rb')
    end

    def install_node_dependency
      yarn_packages = ['bootstrap@4.5.0', 'jquery@3.5.1', 'popper.js', 'moment', 'tempusdominus-bootstrap-4', '@fortawesome/fontawesome-free', 'data-confirm-modal']
      run "yarn add #{yarn_packages.join(' ')}" unless yarn_packages.empty?
    end

    def install_cell_concept_namespacer_on_application_record
      inject_into_file 'app/models/application_record.rb', "\ninclude KonoUtilsBootstrapView4::BaseClassConceptNs\n", after: "ActiveRecord::Base"
    rescue Exception => e
      say "Attenzione, includere a mano KonoUtilsBootstrapView4::BaseClassConceptNs
            nel modello da cui darivano i modelli del base editing - #{e.message}", :red
    end

    def append_dependecy_to_assets
      js_requirements = [
        'kono_utils_bootstrap_view4/application'
      ]
      KonoUtilsBootstrapView4.configuration.moment_js_locales.each do |l|
        js_requirements << "moment/locale/#{l}.js"
      end

      rails6 = Gem::Version.new('6')
      if rails6 <= Gem::Version.new(Rails.version)
        say "in rails 6 dobbiamo avere webpacker che compila erb, creiamo un file erb che includa le nostre dipendenze", :yellow
        run "rails webpacker:install:erb"
        #cancelliamo il file di esempio
        remove_file 'app/javascript/packs/hello_erb.js.erb'
        template 'kono_utils_bootstrap_view4.js.erb.template', Rails.root.join('app', 'javascript', 'packs', 'application.js.erb')
        say "Ricorda di aggiungere nel layout  <%= javascript_pack_tag 'application' %>", :yellow
      else
        inject_into_file 'app/assets/javascripts/application.js',
                         "#{requirements.collect { |c| "\n//= require #{c}" }.join}\n",
                         before: "//= require_tree ."
      end


      requirements = [
        'kono_utils_bootstrap_view4/application'
      ]
      inject_into_file 'app/assets/stylesheets/application.css',
                       "#{requirements.collect { |c| "\n *= require #{c}" }.join}\n",
                       before: " *= require_tree ."

    end

    def append_gem_dependency

      dips = [
        'cells-erb', # inserita in installazione come specificato qua http://trailblazer.to/gems/cells/rails.html#engine-render-problems
        'cells-rails',
        'kaminari-cells'
      ]
      say "AGGIUNGO dipendenze per concepts, #{dips.join("  ")}", :green

      dips.each do |dip|
        gem dip
      end


    end
  end
end