module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          # Campo per readonly
          class ReadOnly < Base

            def field_options
              super.merge({ disabled: true })
            end

            def show(&block)
              render "forms/fields/base"
            end

          end
        end
      end
    end
  end
end
