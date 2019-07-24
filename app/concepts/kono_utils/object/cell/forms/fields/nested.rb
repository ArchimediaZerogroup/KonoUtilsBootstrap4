module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  # la base class di un nested diventa il modello della relazione
  class Nested < Base


    alias_method :parent_base_class, :base_class
    def base_class
      form.object.class.reflect_on_association(attribute_name).klass
    end


    def show(&block)
      initialize_first_nested
      form.simple_fields_for(attribute_name) do |inside_form|
        render({locals: {inside_form: inside_form}}, &block).html_safe
      end
    end

    ##
    # Per i nested abbiamo un elenco di campi da visualizzare,
    # questo elenco ci viene fornito tramite options
    def inner_fields
      model.inner_fields
    end


    def initialize_first_nested
      form.object.send(attribute_name).build if form.object.send(attribute_name).empty?
    end

  end
end
