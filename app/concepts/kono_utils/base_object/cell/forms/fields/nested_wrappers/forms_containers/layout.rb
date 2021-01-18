module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          ##
          # Rappresenta il layout del container del Wrapper
          # abbiamo la versione Standard e versione Table
          ##
          class NestedWrappers::FormsContainers::Layout < Base

            delegates :parent_cell, :target_container_for_new_nested

            def parent_cell
              context[:parent_cell]
            end
          end
        end
      end
    end
  end
end
