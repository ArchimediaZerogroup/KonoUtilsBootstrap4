module KonoUtils::Object::Cell::Forms # namespace
  # Classe che si occupa di generare il container della form
  class Container < Base

    def show(&block)
      logger.tagged(dom_id(form.object)) do
        super
      end
    end

    ##
    # Gli attributi da stampare sono un elenco delle options oppure estrapolati tramite la policy
    def form_attributes
      options[:form_attributes] || KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).editable_attributes)
    end



  end
end