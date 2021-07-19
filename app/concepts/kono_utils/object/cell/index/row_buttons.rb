module KonoUtils
  module Object
    module Cell
      module Index # namespace
        class RowButtons < Base # class

          ##
          # Restituisce la policy per la riga, non viene instanziata più volte per oggetto
          def cached_policy
            @_cached_policy ||= policy(model)
          end
        end
      end
    end
  end
end