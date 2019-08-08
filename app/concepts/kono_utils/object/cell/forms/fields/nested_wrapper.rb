module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  # la base class di un nested diventa il modello della relazione
  class NestedWrapper < Base


    alias_method :parent_base_class, :base_class

    def base_class
      reflection_association.klass
    end


    def show(&block)
      initialize_first_nested
      super
    end

    # causa di una stranezza di simple form che non ritiene safe il contenuto passato
    def inner_form_block
      form.simple_fields_for(attribute_name) do |inside_form|
        capture do
          yield(inside_form)
        end.html_safe
      end
    end

    ##
    # Per i nested abbiamo un elenco di campi da visualizzare,
    # questo elenco ci viene fornito tramite options
    def inner_fields
      model.inner_fields
    end


    ##
    # Inizializza un nuovo record se necessario.
    # Si basa sulla reflection dell'associazione.
    # reflections supportate:
    # - has_one
    # - has_many
    def initialize_first_nested
      case reflection_association.macro
      when :has_one
        form.object.send("build_#{attribute_name}") if form.object.send(attribute_name).nil?
      when :has_many
        form.object.send(attribute_name).build if form.object.send(attribute_name).empty?
      else
        raise "not defined - #{reflection_association.macro}"
      end
    end


    def target_container_for_new_nested
      'interno_nuovo_TODO' #FIXME
    end

    protected

    def reflection_association
      form.object.class.reflect_on_association(attribute_name)
    end

  end
end
