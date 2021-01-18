module KonoUtils
  module Object
    module Cell
      module Forms
        # Layout Standard del contenitore della Form
        class Containers::Layout < Base

          def container_dom_id
            options[:container_dom_id] || dom_id(form.object)
          end

          def container_classes
            [:row] + (options[:container_classes] || [dom_class(form.object)])
          end

        end
      end
    end
  end
end