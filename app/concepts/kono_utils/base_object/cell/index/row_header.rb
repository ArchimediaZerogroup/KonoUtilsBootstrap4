module KonoUtils
  module BaseObject
    module Cell
      module Index # namespace
        class RowHeader < Row # class

          ##
          # Questa funzione serve per stampare il contenuto dell'header
          def print_column(field)
            block_given? ? capture { yield(field) } : base_class.han(field)
          end

        end
      end
    end
  end
end