module KonoUtils::Object::Cell::Forms # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Field < Base

    ##
    # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
    # e quindi stampare un determinato campo in modo differente
    # si occupa anche di gestire i campi provenienti dalla policy nel caso siano a più livelli con i nested
    # prendiamo in considerazione la situazione con has_many :campo=>[] o con :campo=>[:ciao,:pippo,:pluto]
    def show
      if model.is_a?(Hash)
        #devo nestarlo
        bf = ActiveSupport::SafeBuffer.new

        raise model.inspect

        model.each do |k, v|
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
        form.input model
      end
    end


  end
end