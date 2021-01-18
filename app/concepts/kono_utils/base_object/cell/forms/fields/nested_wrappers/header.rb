module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          ##
          # Rappresenta la classe per la renderizzazione dell'header nel nested in modo da aggiungere o meno
          # la gestione del bottone di aggiunta
          class NestedWrappers::Header < Base

            delegates :parent_cell, :reflection_association
            delegates :parent_cell, :target_container_for_new_nested
            delegates :parent_cell, :has_multiple_elements?

            def parent_cell
              context[:parent_cell]
            end

            ##
            # Controlla se dobbiamo renderizzare un bottone per fare la build di un nuovo record
            # @return [TrueClass|FalseClass]
            def build_new_nested?
              has_multiple_elements? and form.object.persisted?
            end

            def target_container
              inject_as_modal ? 'body' : "##{target_container_for_new_nested}"
            end

            def inject_as_modal
              options[:inject_as_modal]
            end

          end
        end
      end
    end
  end
end
