module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          # Campo checkbox
          class CheckBox < Base

            def base_field_options
              super.merge(as: :boolean)
            end

          end
        end
      end
    end
  end
end