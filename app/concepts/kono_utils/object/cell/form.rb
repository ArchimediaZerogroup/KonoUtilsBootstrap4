module KonoUtils::Object::Cell # namespace
  class Form < Base

    load('action_view/helpers/form_helper.rb')
    include ActionView::Helpers::FormHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::FormOptionsHelper


    def forms_options
      [model]
    end


    def form_attributes
      KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).editable_attributes)
    end

    def cell_column_class(field)
      "col-md-12"
    end


  end
end