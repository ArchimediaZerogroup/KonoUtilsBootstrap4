module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Rappresenta il layout del container del Wrapper
  # abbiamo la versione Standard e versione Table
  ##
  class NestedWrappers::Layout < Base

    delegates :parent_cell, :target_container_for_new_nested


    def parent_cell
      context[:parent_cell]
    end
  end
end
