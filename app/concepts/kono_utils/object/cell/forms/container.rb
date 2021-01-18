module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        # Classe che si occupa di generare il container della form
        class Container < Base

          def show(&block)
            logger.tagged(dom_id(form.object)) do
              super
            end
          end

          ##
          # Gli attributi da stampare sono un elenco delle options oppure estrapolati tramite la policy
          def form_attributes
            options[:form_attributes] || KonoUtilsBootstrapView4::EditableField.editable_fields_to_field_array(policy(model).editable_attributes)
          end

          def field_selector_layout
            layout = context[:overriden_layout].blank? ? "layout" : context[:overriden_layout]
            layout_ns("cell/forms/field_selectors/#{layout}")
          end

        end
      end
    end
  end
end