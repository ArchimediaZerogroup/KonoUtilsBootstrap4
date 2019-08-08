module KonoUtils::Object::Cell::Forms # namespace
  # Classe che si occupa di selezionare il campo corretto nella form
  #
  # il model sarà un [KonoUtilsBootstrapView4::EditableField]
  class FieldSelector < Base

    ##
    # Questa funzione serve per essere sovrascritta dal field generico nella cella specifica del modello
    # e quindi stampare un determinato campo in modo differente
    # Viene normalizzato il campo in model contenente il KonoUtilsBootstrapView4::EditableField
    def get_field
      logger.debug { "SELECT_FIELD:#{form.object.class.name}->#{model}" }
      if model.is_nested?
        #devo nestarlo
        concept("cell/forms/fields/nested_wrapper", model, layout: layout_ns('cell/forms/fields/layout'))
      else
        # decidiamo se renderizzare un'associazione o meno
        if form.object.class.reflect_on_association(model.name)
          concept("cell/forms/fields/association", model, layout: layout_ns('cell/forms/fields/layout'))
        else
          concept("cell/forms/fields/base", model, layout: layout_ns('cell/forms/fields/layout'))
        end
      end
    end


  end
end