module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Rappresenta la classe che renderizza il contenitore della singola nested form
  ##
  class NestedWrappers::FormsContainer < Base

    delegates :parent_cell, :has_multiple_elements?

    def parent_cell
      context[:parent_cell]
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
    # questo elenco ci viene fornito tramite il modello EditableField, il quale elabora rispetto ai nested delle policy
    def inner_fields
      model.inner_fields
    end

  end
end
