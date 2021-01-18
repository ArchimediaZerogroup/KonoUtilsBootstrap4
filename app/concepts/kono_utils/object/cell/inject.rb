module KonoUtils
  module Object
    module Cell
      ##
      # Classe per la gestione dell'inserimento del contenuto e javascript per l'azione inject
      # - Options:
      #   html_manipulation_method: [(:append),:prepend,:replaceWith] ->  definisce come deve operare il javascript
      #                                                             nell'operazione di manipolazione del contenitore
      #                                                             in cui inserire il contenuto
      #   inject_show_modal:  [Boolean]  -> identifica se stiamo visualizzando la show della modal o meno, default a false
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
          layout_ns("cell/forms/fields/nested_wrappers/forms/#{nested_layout}")
        end

        ##
        # TODO documentare cosa serve, qual'era il concetto di questo pezzo di codice
        def remote_context
          params.dig(:kono_utils, :context).to_h.deep_symbolize_keys || {}
        end

        def form_content
          #nel caso stiamo visualizzando il rimpiazzo dell'output delle modals(quando per esempio abbiamo aggiornato od inserito un nuovo record)
          if options.fetch(:inject_show_modal, false)

            container = nil
            simple_form_for(model, as: "#{params.dig(:kono_utils, :structure_nested)}[#{Time.now.to_i}]", url: '#') do |form|

              container = concept("cell/forms/fields/nested_modal_wrappers/show", model,
                                  show_remove_button: true,
                                  layout: layout_ns("cell/forms/fields/nested_wrappers/forms/layout"),
                                  context: {
                                    form: form,
                                    base_class: base_class,
                                    nested_layout: nested_layout,
                                    current_user: context[:current_user]
                                  }.merge(remote_context)
              )

            end

            container

          else
            if inject_as_modal?

              concept("cell/modals/container",
                      concept("cell/form", model,
                              form_options: { remote: true },
                              context: {
                                nested_layout: nested_layout,
                                modal_upgraded_target_container: params.dig(:kono_utils, :modal_upgraded_target_container)
                              }.merge(context)),
                      layout: model.class.layout_ns("cell/modals/containers/layout")
              )

            else
              container = nil
              simple_form_for(model, as: "#{params.dig(:kono_utils, :structure_nested)}[#{Time.now.to_i}]", url: '#') do |form|

                container = concept("cell/forms/fields/nested_wrappers/form", model,
                                    show_remove_button: !inject_as_modal?, #per le modal non visualizziamo direttamente il bottone
                                    layout: form_layout,
                                    context: {
                                      form: form,
                                      base_class: base_class,
                                      current_user: context[:current_user]
                                    }.merge(remote_context)
                )

              end

              container

            end
          end
        end

        def target_container
          if options.fetch(:inject_show_modal, false)
            "##{params.dig(:kono_utils, :modal_upgraded_target_container)}"
          else
            params.dig(:kono_utils, :target_container)
          end
        end

        def html_manipulation_method
          methodo = options.fetch(:html_manipulation_method, :append).to_sym
          raise "METODI DI MANIPOLAZIONE ACCETTATI: :append, :prepend, :replaceWith" unless [:append, :prepend, :replaceWith].include?(methodo)
          methodo
        end

        def inject_as_modal
          params.dig(:kono_utils, :inject_as_modal)
        end

        private

        def nested_layout
          remote_context[:nested_layout].blank? ? "layout" : remote_context[:nested_layout]
        end

        def inject_as_modal?
          !inject_as_modal.blank?
        end

      end
    end
  end
end