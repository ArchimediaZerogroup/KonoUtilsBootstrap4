module KonoUtils::Object::Cell # namespace
  class Show < Base


    ##
    # Elenco dei campi da visualizzare, altrimenti estrapolati dalla policy
    def displayable_attributes
      options[:displayable_attributes] || KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).displayable_attributes)
    end

  end
end