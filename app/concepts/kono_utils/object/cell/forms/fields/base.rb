module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        # La cella base dei componenti della form contiene sempre la form come model
        class Fields::Base < Base

          ##
          # Campo del record da visualizzare nella form
          def attribute_name
            model.name
          end

          def field_options
            base_field_options.merge(options[:field_options] || {})
          end

          def base_field_options
            out = {}

            out[:as] = :hidden if model.is_hidden?

            out
          end

        end
      end
    end
  end
end
