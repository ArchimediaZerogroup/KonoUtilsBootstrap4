module KonoUtils
  module Object
    module Cell
      class Form < Base

        load('action_view/helpers/form_helper.rb')
        include ActionView::Helpers::FormHelper
        include SimpleForm::ActionViewExtensions::FormHelper
        include ActionView::Helpers::DateHelper
        include ActionView::Helpers::FormOptionsHelper

        layout("forms/layout")

        ##
        # Metodo che mi ritorna la lista degli argomenti da passare a simple form.
        # @return [Array]
        #
        # ES:
        # [model] -> model deve essere l'ActiveRecord da utilizzare come oggetto della form
        #
        # [model,{ url:helper_path_custom }] -> come secondo parametro abbiamo l'hash delle opzioni da poter passare al form builder
        # se al concept passiamo form_options come opzione, queste vengono mergiate nelle opzioni standard
        def forms_options
          [model, _form_options]
        end

        protected

        def form_id
          dom_id(model, SecureRandom.uuid)
        end

        def container_layout
          layout = context[:nested_layout].blank? ? "layout" : context[:nested_layout]
          layout_ns("cell/forms/containers/#{layout}")
        end

        private

        ##
        # Opzioni aggiuntive per la form
        def _form_options
          opts = options[:form_options] || {}
          html = opts.fetch(:html, { multipart: true })
          html[:id] = form_id

          opts.merge({ html: html })

        end

      end
    end
  end
end