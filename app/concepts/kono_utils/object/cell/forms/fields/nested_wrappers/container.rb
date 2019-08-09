class Container
end

module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Rappresenta la classe che renderizza il contenitore della singola nested form
  ##
  class NestedWrappers::Container < Base

    ##
    # Per i nested abbiamo un elenco di campi da visualizzare,
    # questo elenco ci viene fornito tramite il modello EditableField dral nested_wrapper,
    # il quale elabora rispetto ai nested delle policy, oppure direttamente dalla policy del model
    def form_attributes
      options[:form_attributes] || KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).editable_attributes)
    end


    ##
    # Visualizzare o meno il bottone di cancellazione
    def show_remove_button?
      options[:show_remove_button] || false
    end

    ##
    # Id per identificare il container che raggruppa campi e bottone per cancellare
    def container_id
      @_unique ||= SecureRandom.uuid
    end

  end
end
