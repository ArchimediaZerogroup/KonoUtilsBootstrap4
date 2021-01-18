module KonoUtils
  module Object
    module Cell

      class Show < Base

        # @param field [KonoUtilsBootstrapView4::EditableField] campo da cui estrapolare il valore
        def get_field(field)
          model.send(field.name)
        end

        # @param field [KonoUtilsBootstrapView4::EditableField] campo da cui estrapolare la descrizione
        def field_description(field)
          model.class.han field.name
        end

        ##
        # Elenco dei campi da visualizzare, altrimenti estrapolati dalla policy
        # @return [Array<KonoUtilsBootstrapView4::EditableField>]
        def displayable_attributes
          if options[:displayable_attributes]
            KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(options[:displayable_attributes])
          else
            KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).displayable_attributes)
          end
        end

      end
    end
  end
end
