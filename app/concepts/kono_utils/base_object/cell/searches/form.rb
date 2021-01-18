module KonoUtils
  module BaseObject
    module Cell
      ##
      # Classe variante della ricerca
      class Searches::Form < Form

        ##
        # Destinazione bottoni nel layout
        def send_buttons_to
          :search_buttons_container
        end

      end
    end
  end
end