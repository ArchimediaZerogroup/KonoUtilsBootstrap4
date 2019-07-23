module KonoUtils::Object::Cell # namespace
  class Base < Trailblazer::Cell # class
    view_paths << "#{KonoUtilsBootstrapView4::Engine.root}/app/concepts"

    include Pundit
    include Kaminari::Helpers::HelperMethods
    include Kaminari::Cells
    include FontAwesome::Rails::IconHelper


    ##
    # Helpers di controller
    delegates :parent_controller, :base_class
    delegates :parent_controller, :new_custom_polymorphic_path
    delegates :parent_controller, :edit_custom_polymorphic_path
    delegates :parent_controller, :index_custom_polymorphic_path


    def parent_helpers
      parent_controller.helpers
    end


    alias_method :legacy_concept, :concept

    def concept(name, model = nil, options = {})
      legacy_concept(base_class.concept_ns(name), model, options)
    end


    def _prefixes
      base_class.concept_prefix + super + parent_controller.lookup_context.view_paths.collect(&:to_path)
    end

    def current_user
      context[:current_user]
    end

    def title_mod
      "#{t(:edit)} #{model.mn}"
    end

    def title_new
      "#{t(:new)} #{model.mn}"
    end

    def title_newa
      "#{t(:newa)} #{model.mn}"
    end

    def title_del
      "#{t(:del)} #{model.mn}"
    end

    def title_edit_g
      "#{t("edit_title_#{model_gender}", default: 'Modifica')} #{model.mn}"
    end

    def title_new_g
      "#{t("new_title_#{model_gender}", default: 'Nuovo')} #{model.mn}"
    end

    def title_del_g
      "#{t("del_title_#{model_gender}", default: 'Cancella')} #{model.mn}"
    end

    def model_gender
      t("activerecord.modelgender.#{model.class.name.underscore.to_sym}", :default => :m).to_sym
    end

  end
end