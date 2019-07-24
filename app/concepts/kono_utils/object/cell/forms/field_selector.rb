module KonoUtils::Object::Cell::Forms # namespace
  # Classe che si occupa di selezionare il campo corretto nella form
  #
  # il model sarà un KonoUtilsBootstrapView4::EditableField
  class FieldSelector < Base

    ##
    # Questa funzione serve per essere sovrascritta dal field generico nella cella specifica del modello
    # e quindi stampare un determinato campo in modo differente
    # si occupa anche di gestire i campi provenienti dalla policy nel caso siano a più livelli con i nested
    # prendiamo in considerazione le situazioni con
    # - has_many:
    #             - :campo=>[] -> come per le checkbox
    #             - :campo=>[:ciao,:pippo,:pluto] -> nested forms
    def get_field
      Rails.logger.debug {"SELECT_FIELD:#{form.object.class.name}->#{model}"}
      if model.is_a?(Hash)
        #devo nestarlo
        bf = ActiveSupport::SafeBuffer.new

        model.each do |k, v|
          if v.length == 0
            #caso in cui è un elemento normale, ma che ha una selezione multipla
            bf.safe_concat(concept("cell/forms/field", k).to_s)
          else
            #caso in cui potremmo essere in un campo di multipli elementi con vari valori ognuno
            bf.safe_concat(concept("cell/forms/fields/nested", k, fields: v).to_s)
          end
        end
        bf
      else
        # decidiamo se renderizzare un'associazione o meno
        if form.object.class.reflect_on_association(model)
          concept("cell/forms/fields/association", model)
        else
          concept("cell/forms/fields/base", model)
        end
      end
    end


  end
end