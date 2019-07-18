module KonoUtils::Object::Cell::Index # namespace
  class Table < Base


    ##
    # Questa funzione serve per stampare il contenuto dell'header
    def print_column_head(field)
      block_given? ? yield(field) : base_class.han(field)
    end


    def pagination
      'paginazione da pensare'
    end

    alias_method :pagination_top, :pagination
    alias_method :pagination_bottom, :pagination

  end
end