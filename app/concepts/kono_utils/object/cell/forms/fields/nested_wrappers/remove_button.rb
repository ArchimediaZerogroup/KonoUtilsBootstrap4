module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Bottone per la rimozione della riga nested
  class NestedWrappers::RemoveButton < KonoUtils::Object::Cell::Buttons::Delete


    def url_to
      "#"
    end

    def automatic_remove_options
      {}
    end

    def show(&block)
      super + render(&block).html_safe
    end

    ##
    # ID div in cui definire che l'elemento viene rimosso
    def remove_target
      options[:remove_target]
    end


  end
end
