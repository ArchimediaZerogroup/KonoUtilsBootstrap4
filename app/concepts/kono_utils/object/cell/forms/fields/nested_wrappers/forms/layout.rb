module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        module Fields

          class NestedWrappers::Forms::Layout < Base

            def container_id
              context[:container_id] # generato dalla cella Form, trovare sistema più bello? FIXME
            end

            def object_header
              form.object.class.model_name.human
            end

          end
        end
      end
    end
  end
end
