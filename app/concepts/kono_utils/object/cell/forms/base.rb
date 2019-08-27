module KonoUtils::Object::Cell # namespace
  # La cella base dei componenti della form
  # ha sempre un metodo form che viene ricevuto dal contesto della form
  class Forms::Base < Base


    def form
      context[:form]
    end


    ##
    # Metodo standard per avere informazioni sul layout, se siamo in nested, si instaura un context con layout
    # che se lo porta ricorsivamente all'interno del programma
    def layout
      options[:layout] || context[:overriden_layout] || nil
    end

  end
end