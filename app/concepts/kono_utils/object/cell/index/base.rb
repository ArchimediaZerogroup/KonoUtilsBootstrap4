module KonoUtils::Object::Cell # namespace
  class Index::Base < Base



    # @return [Array<Symbol>] elenco delle colonne da mostrare
    def table_columns
      policy(base_class.new).show_attributes
    end

  end
end