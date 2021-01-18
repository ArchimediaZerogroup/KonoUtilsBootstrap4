module KonoUtils
  module BaseObject
    module Cell
      module Buttons # namespace
        class Create < Base

          def url_to
            options[:url_to] || new_custom_polymorphic_path(model)
          end

          def specific_button_class
            "btn-success"
          end

          def button_title
            title_new
          end

          def button_content
            options.fetch(:content, fa_icon("plus"))
          end

        end
      end
    end
  end
end