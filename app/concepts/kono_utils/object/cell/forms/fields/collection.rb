module KonoUtils::Object::Cell::Forms::Fields # namespace
  #
  # Classe per la gestione del campo collection
  class Collection < Base

    def base_field_options
      super.merge(as: :select, collection: options.fetch(:collection, []))
    end

  end
end
