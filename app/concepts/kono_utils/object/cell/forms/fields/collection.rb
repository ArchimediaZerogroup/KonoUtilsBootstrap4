module KonoUtils::Object::Cell::Forms::Fields # namespace
  #
  # Classe per la gestione del campo collection
  class Collection < Base

    # @return [Hash]
    def base_field_options
      super.merge(as: :select, collection: collection)
    end

    # @return [Array,Hash]
    def collection
      options.fetch(:collection, [])
    end

  end
end
