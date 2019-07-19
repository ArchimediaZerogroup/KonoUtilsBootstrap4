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
    delegates :parent_controller, :form_attributes
    delegates :parent_controller, :table_columns
    delegates :parent_controller, :new_custom_polymorphic_path
    delegates :parent_controller, :edit_custom_polymorphic_path
    delegates :parent_controller, :index_custom_polymorphic_path

    ##
    # Base Editing Helpers
    delegates :parent_helpers, :edit_button
    delegates :parent_helpers, :delete_button


    def parent_helpers
      parent_controller.helpers
    end

    def _prefixes
      base_class.concept_prefix + super + parent_controller.lookup_context.view_paths.collect(&:to_path)
    end

    def current_user
      context[:current_user]
    end

  end
end