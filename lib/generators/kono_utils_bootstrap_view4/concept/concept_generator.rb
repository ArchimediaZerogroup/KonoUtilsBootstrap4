require 'rails/generators'
module KonoUtilsBootstrapView4
  class ConceptGenerator < Rails::Generators::Base
    include ActiveSupport::Inflector

    source_root File.expand_path('../templates', __FILE__)

    desc "Costruisce la struttura delle cartelle e il wrapper per la selezione dei campi da renderizzare\n" +
           "Passando CELL viene anche generata la classe nella posizione corretta"
    argument :model_name, type: :string, desc: 'ModelName'
    argument :cell, type: :string, default: false, desc: "Nome cella da copiare"


    def generate_folders

      if safe_constantize(model_name)
        FileUtils.mkdir_p(File.join(path, 'cell'))
        FileUtils.mkdir_p(File.join(path, 'view'))
      else
        puts "Modello inesistente"
      end

    end

    ##
    # Automatismo non completo, TO_COMPLETE
    # class_option :generate_view, type: :boolean, default: false, desc: "Per la cella passata viene copiato la view"
    # class_option :generate_class, type: :boolean, default: false, desc: "Per la cella passata viene copiata la classe"
    #
    # def copy_cell
    #   unless cell.blank?
    #     dirs = []
    #
    #     dirs << ['cell', 'view', 'erb'] if options.generate_view
    #     dirs << ['cell', 'cell', 'rb'] if options.generate_class
    #
    #     puts "Devi selezionare almeno uno dei generatori: --generate-view  o --generate-class" if dirs.empty?
    #
    #
    #     dirs.each do |c|
    #
    #       component_to_override = "#{cell.gsub(/#{c[0]}/, c[1])}.#{c[2]}"
    #       path_src = File.join('app', 'concepts', 'kono_utils', component_to_override)
    #
    #       path_dest = File.join('app', 'concepts', tableize(safe_constantize(model_name).name), component_to_override)
    #
    #       puts path_src
    #       puts path_dest
    #
    #       #copio i files
    #       copy_file(path_src, path_dest)
    #
    #     end
    #   end
    # end


    class_option :field_selector, type: :boolean, default: false, desc: "Copia il template per il selettore dei campi"
    class_option :form, type: :boolean, default: false, desc: "Copia il template della form"

    def copy_templates
      if options.field_selector
        template 'forms/field_selector.template', File.join(path, "cell", "forms", "field_selector.rb")
      end
      if options.form
        template 'form.template', File.join(path, "cell", "form.rb")
      end
    end


    private

    def path
      Rails.application.root.join('app', 'concepts', tableize(safe_constantize(model_name).name))
    end


  end
end