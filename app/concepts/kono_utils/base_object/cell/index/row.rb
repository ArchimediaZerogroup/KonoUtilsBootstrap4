module KonoUtils
  module BaseObject
    module Cell
      module Index # namespace
        class Row < Base # class

          #@!attribute [ActiveRecord::Base] model -> record della riga che stiamo stampando

          ##
          # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
          # @param [Symbol] field campo da renderizzare
          # @return [Object] valore da visualizzare nella colonna
          def print_column(field)
            model.send(field)
          end

          ##
          # Questa funzione serve per generare la colonna della tabella
          #
          # @param [String] field campo che mi identifica il valore del record
          # @param [Symbol] column tipo di colonna (:td,:th)
          # @yieldparam column_class [String]  stringa contenente la classe della colonna
          # @yieldparam column_id [String]  stringa contenente l'id generato aggiunto cul tag della colonna
          # @yieldreturn [String] contenuto da inserire nella colonna
          def column_builder(field, column)
            column_class = "column_#{field}"
            column_id = ''
            if model
              column_id = "#{column_class}-#{dom_id(model)}"
            end
            content_tag column, class: column_class, id: column_id do
              capture do
                yield column_class, column_id
              end.html_safe
            end
          end

        end
      end
    end
  end
end