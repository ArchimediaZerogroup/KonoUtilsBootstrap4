module KonoUtils::Object::Cell # namespace
  class Search < Base


    def collapse_container_id
      dom_id(model,"search_form")
    end

    def data_loaded?
      model.data_loaded?
    end

    ##
    # Andiamo a restituire il layout da utilizzare nel form
    def form_layout
      layout_ns("cell/forms/containers/search_layout")
    end

  end
end