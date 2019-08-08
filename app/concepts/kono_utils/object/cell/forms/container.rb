module KonoUtils::Object::Cell::Forms # namespace
  # Classe che si occupa di generare il container della form
  class Container < Base

    def form_attributes
      KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).editable_attributes)
    end

    def cell_column_class(field)
      "col-md-12"
    end

  end
end