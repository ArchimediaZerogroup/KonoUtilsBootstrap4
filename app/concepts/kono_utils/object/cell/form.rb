module KonoUtils::Object::Cell # namespace
  class Form < Base

    load('action_view/helpers/form_helper.rb')
    include ActionView::Helpers::FormHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::FormOptionsHelper

    ##
    # Metodo che mi ritorna la lista degli argomenti da passare a simple form.
    # @return [Array]
    #
    # ES:
    # [model] -> model deve essere l'ActiveRecord da utilizzare come oggetto della form
    #
    # [model,{ url:helper_path_custom }] -> come secondo parametro abbiamo l'hash delle opzioni da poter passare al form builder
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