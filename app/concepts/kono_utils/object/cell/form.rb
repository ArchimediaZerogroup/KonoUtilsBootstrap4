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





  end
end