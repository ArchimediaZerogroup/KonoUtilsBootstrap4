module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          class NestedModalWrappers::FormsContainer < NestedWrappers::FormsContainer

            def render_cell_container
              "cell/forms/fields/nested_modal_wrappers/show"
            end

          end
        end
      end
    end
  end
end
