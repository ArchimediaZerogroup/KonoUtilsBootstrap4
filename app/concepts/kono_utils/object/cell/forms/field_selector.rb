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
      logger.debug { "SELECT_FIELD:#{form.object.class.name}->#{model.name}" }
      if model.is_nested?
        #devo nestarlo
        concept("cell/forms/fields/nested_wrapper", model, layout: get_layout('nested_wrappers'))
      else
        # decidiamo se renderizzare un'associazione o meno
        if form.object.class.reflect_on_association(model.name)
          concept("cell/forms/fields/association", model, layout: get_layout('associations'))
        else

          attribute_type = form.object.class.type_for_attribute(model.name).type

          #riconosciamo se sono file allegati
          file = form.object.send(model.name) if form.object.respond_to?(model.name)
          if file && SimpleForm.file_methods.any? { |m| file.respond_to?(m) }
            attribute_type = :file
          end

          # Riconoscimento degli enum
          if form.object.class.type_for_attribute(model.name).is_a? ActiveRecord::Enum::EnumType
            attribute_type = :enum
          end

          # riconosciamo la tipologia di campo per renderizzare quello corretto
          case attribute_type
          when :date
            concept("cell/forms/fields/date_field", model, layout: get_layout('bases'))
          when :time
            concept("cell/forms/fields/time_field", model, layout: get_layout('bases'))
          when :datetime
            concept("cell/forms/fields/date_time_field", model, layout: get_layout('bases'))
          when :file
            concept("cell/forms/fields/file_field", model, layout: get_layout('bases'))
          when :enum
            concept("cell/forms/fields/enum", model, layout: get_layout('bases'))
          else
            logger.debug { "TIPO non riconosciuto: #{form.object.class.type_for_attribute(model.name).type} -> #{form.object.class.type_for_attribute(model.name).inspect}" }
            concept("cell/forms/fields/base", model, layout: get_layout('bases'))
          end


        end
      end
    end

    def get_layout(field_ns)
      layout = context[:overriden_layout].blank? ? "layout" : context[:overriden_layout]
      layout_ns("cell/forms/fields/bases/#{layout}")
    end


  end
end