module KonoUtils::Object::Cell # namespace
  ##
  # Classe per la gestione dell'inserimento del contenuto e javascript per l'azione inject
  class Inject < Base

    load('action_view/helpers/form_helper.rb')
    include ActionView::Helpers::FormHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::FormOptionsHelper


    def params
      @_p ||= options[:params]
      @_p.permit!
      @_p
    end

    def form_layout
      layout = remote_context[:nested_layout].blank? ? "layout" : remote_context[:nested_layout]
      layout_ns("cell/forms/fields/nested_wrappers/forms/#{layout}")
    end

    def remote_context
      params.dig(:kono_utils, :context).to_h.deep_symbolize_keys || {}
    end

    def form_content

      container = nil
      simple_form_for(model, as: "#{params.dig(:kono_utils, :structure_nested)}[#{Time.now.to_i}]", url: '#') do |form|

        container = concept("cell/forms/fields/nested_wrappers/form", model,
                            show_remove_button: true,
                            layout: form_layout ,
                            context: {form: form, base_class: base_class, current_user: context[:current_user]}.merge(remote_context)
        )

      end

      for_modal(container)
    end

    def target_container
      params.dig(:kono_utils, :target_container)
    end


    def for_modal(content)
      inject_as_modal = params.dig(:kono_utils, :inject_as_modal)

      unless inject_as_modal.blank?
        content = concept("cell/modals/container",
                            content,
                            layout: model.class.layout_ns("cell/modals/containers/layout")
        )
      end

      content
    end

  end
end