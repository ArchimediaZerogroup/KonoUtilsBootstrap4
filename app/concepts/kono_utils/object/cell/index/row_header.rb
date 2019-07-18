module KonoUtils::Object::Cell::Index # namespace
  class RowHeader < Row # class

    ##
    # Questa funzione serve per stampare il contenuto dell'header
    def print_column(field)
      block_given? ? yield(field) : base_class.han(field)
    end

  end
end