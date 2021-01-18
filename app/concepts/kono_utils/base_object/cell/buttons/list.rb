module KonoUtils
  module BaseObject
    module Cell
      module Buttons # namespace
        class List < Base

          def url_to
            options[:url_to] || index_custom_polymorphic_path(model)
          end

          def specific_button_class
            'btn-link'
          end

          def button_content
            options.fetch(:content, fa_icon("list"))
          end

        end
      end
    end
  end
end