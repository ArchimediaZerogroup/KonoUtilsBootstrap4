module KonoUtils::Object::Cell::Forms::Fields::NestedWrappers::FormsContainers # namespace
  ##
  # Rappresenta il layout del container del Wrapper
  # abbiamo la versione Standard e versione Table
  ##
  class TableLayout < Layout



    def columns_to_show
      model.inner_fields.reject(&:is_hidden?)
    end


  end
end
