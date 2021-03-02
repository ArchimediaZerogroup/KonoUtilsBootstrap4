module KonoUtils
  module Object
    module Cell
      module Buttons # namespace
        class Show < Base

          def url_to
            options[:url_to] || show_custom_polymorphic_path(model)
          end

          def specific_button_class
            'btn-info'
          end

          def button_content
            options.fetch(:content, fa_icon("eye"))
          end

        end
      end
    end
  end
end