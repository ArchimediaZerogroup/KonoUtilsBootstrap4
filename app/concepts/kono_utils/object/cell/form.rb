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
      policy(model).permitted_attributes
    end

    def cell_column_class(field)
      "col-md-12"
    end


  end
end