module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          module NestedWrappers
            module FormsContainers # namespace
              ##
              # Rappresenta il layout del container del Wrapper
              # abbiamo la versione Standard e versione Table
              ##
              class TableLayout < Layout

                def columns_to_show
                  model.inner_fields.reject(&:is_hidden?)
                end

              end
            end
          end
        end
      end
    end
  end
end
