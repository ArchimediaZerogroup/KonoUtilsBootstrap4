module KonoUtils
  module Object
    module Cell
      ##
      # Classe variante della ricerca
      class Searches::Form < Form

        ##
        # Destinazione bottoni nel layout
        def send_buttons_to
          :search_buttons_container
        end

        # @param [SimpleForm::FormBuilder] form_builder
        # @return [Array<Concept>]
        def submit_buttons(form_builder:)
          super + [concept("cell/buttons/reset_search", model.search_form_builder.to_model)]
        end

      end
    end
  end
end