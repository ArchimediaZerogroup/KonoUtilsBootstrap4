require 'rails/generators'
module KonoUtilsBootstrapView4
  class ConceptGenerator < Rails::Generators::Base
    include ActiveSupport::Inflector

    source_root File.expand_path('../templates', __FILE__)

    desc "Costruisce la struttura delle cartelle e il wrapper per la selezione dei campi da renderizzare"
    argument :model_name, type: :string, desc: 'ModelName'


    def generate_folders

      if safe_constantize(model_name)
        FileUtils.mkdir_p(File.join(path, 'cell'))
        FileUtils.mkdir_p(File.join(path, 'view'))
      else
        puts "Modello inesistente"
      end


    end

    class_option :field_selector, type: :boolean, default: false, desc: "Copia il template per il selettore dei campi"

    def copy_templates
      if options.field_selector
        template 'field_selector.template', File.join(path, "cell","forms", "field_selector.rb")
      end
    end


    private

    def path
      Rails.application.root.join('app', 'concepts', tableize(safe_constantize(model_name).name))
    end


  end
end