module KonoUtils::Object::Cell::Index # namespace
  class Row < Base # class

    ##
    # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
    def print_column(field)
      model.send(field)
    end



    ##
    # Questa funzione serve per generare la colonna della tabella
    #
    # * *Attributes*  :
    #   - colonna
    #   - tipo di colonna td|th
    #   - opzionali     : hash{record} per fare altro
    def column_builder(field, column)
      column_class = "column_#{field}"
      column_id = ''
      if model
        column_id = "#{column_class}-#{dom_id(model)}"
      end
      content_tag column, class: column_class, id: column_id do
        yield column_class, column_id
      end
    end

  end
end