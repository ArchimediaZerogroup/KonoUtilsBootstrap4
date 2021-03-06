module KonoUtils
  module Object
    module Cell
      module Buttons # namespace
        class Delete < Base

          def url_to
            options[:url_to] || destroy_custom_polymorphic_path(model)
          end

          def specific_button_class
            'btn-danger'
          end

          def btn_opts(opts = {})
            custom_options = options.dig(:button_options) || opts
            super(automatic_remove_options.merge(custom_options))
          end

          ##
          # Metodo che è possibili fare override per rimuovere le funzioni di rails di conferma automatica
          def automatic_remove_options
            {
              method: :delete,
              data: { confirm: t(:are_you_sure), title: I18n.t('kono_utils.bootstrap4.buttons.delete.title') },
            }
          end

          def button_content
            options.fetch(:content, fa_icon("trash"))
          end

        end
      end
    end
  end
end