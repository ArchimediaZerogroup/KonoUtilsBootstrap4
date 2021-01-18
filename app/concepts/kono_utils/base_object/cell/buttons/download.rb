module KonoUtils
  module BaseObject
    module Cell
      module Buttons # namespace
        class Download < Base

          def url_to
            options[:url_to] || url_for(model)
          end

          def specific_button_class
            'btn-light'
          end

          def button_content
            options.fetch(:content, fa_icon("download", text: I18n.t('kono_utils.bootstrap4.buttons.download.alt')))
          end

          def btn_opts(opts = {})
            {
              target: :_blank
            }.merge(super)
          end

        end
      end
    end
  end
end