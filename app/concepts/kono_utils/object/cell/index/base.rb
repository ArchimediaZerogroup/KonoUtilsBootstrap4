module KonoUtils::Object::Cell # namespace
  class Index::Base < Base

    ##
    # Questa funzione serve per generare la colonna della tabella
    #
    # * *Attributes*  :
    #   - colonna
    #   - tipo di colonna td|th
    #   - opzionali     : hash{record} per fare altro
    def column_builder(field, column, record: nil)
      column_class = "column_#{field}"
      column_id = ''
      if record
        column_id = "#{column_class}-#{dom_id(record)}"
      end
      content_tag column, class: column_class, id: column_id do
        yield column_class, column_id
      end
    end


  end
end