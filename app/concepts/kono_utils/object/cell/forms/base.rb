module KonoUtils::Object::Cell # namespace
  # La cella base dei componenti della form
  # ha sempre un metodo form che viene ricevuto dal contesto della form
  class Forms::Base < Base


    def form
      context[:form]
    end

    ##
    # Campo del record da visualizzare nella form
    def attribute_name
      model.name
    end


  end
end