module KonoUtils::Object::Cell # namespace
  class Search < Base


    def collapse_container_id
      dom_id(model, "search_form")
    end

    def data_loaded?
      model.data_loaded?
    end

    ##
    # Identifica il contenitore dei bottoni, sia a livello di id DOM che per quanto riguarda la destinazione dei bottoni
    # durante il renderig della form
    def buttons_container
      dom_id(model, 'buttons_container')
    end

    ##
    # Andiamo a restituire il layout da utilizzare nel form
    def form_layout
      layout_ns("cell/forms/containers/search_layout")
    end

  end
end