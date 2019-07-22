module KonoUtils::Object::Cell # namespace
  class Form < Base

    load('action_view/helpers/form_helper.rb')
    include ActionView::Helpers::FormHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::DateHelper


    def forms_options
      [model]
    end


    def form_attributes
      policy(model).permitted_attributes
    end

    def cell_column_class(field)
      "col-md-12"
    end

    ##
    # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
    # e quindi stampare un determinato campo in modo differente
    # si occupa anche di gestire i campi provenienti dalla policy nel caso siano a più livelli con i nested
    # prendiamo in considerazione la situazione con has_many :campo=>[] o con :campo=>[:ciao,:pippo,:pluto]
    def editing_form_print_field(form, field)
      if field.is_a?(Hash)
        #devo nestarlo
        bf = ActiveSupport::SafeBuffer.new

        field.each do |k, v|
          if v.length == 0
            #caso in cui è un elemento normale, ma che ha una selezione multipla
            bf << editing_form_print_field(form, k)
          else
            #caso in cui potremmo essere in un campo di multipli elementi con vari valori ognuno
            bf << nest_editing_form_print_field(form, k, v)
          end
        end
        bf
      else
        form.input field
      end
    end

  end
end