module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        module Fields
          ##
          # Rappresenta la classe che renderizza il contenitore della singola nested form
          ##
          class NestedWrappers::Form < Base

            ##
            # Per i nested abbiamo un elenco di campi da visualizzare,
            # questo elenco ci viene fornito tramite il modello EditableField dal nested_wrapper,
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
              @_unique ||= context[:container_id] = SecureRandom.uuid
            end

            def container_layout
              context[:nested_layout].blank? ? nil : layout_ns("cell/forms/containers/#{context[:nested_layout]}")
            end

            def remove_button_layout
              context[:nested_layout].blank? ? nil : layout_ns("cell/forms/fields/nested_wrappers/remove_buttons/#{context[:nested_layout]}")
            end

          end
        end
      end
    end
  end
end
