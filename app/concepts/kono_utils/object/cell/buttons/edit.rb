module KonoUtils
  module Object
    module Cell
      module Buttons # namespace
        class Edit < Base

          def url_to
            options[:url_to] || edit_custom_polymorphic_path(model)
          end

          def specific_button_class
            'btn-primary'
          end

          def button_content
            options.fetch(:content, fa_icon("edit"))
          end

        end
      end
    end
  end
end