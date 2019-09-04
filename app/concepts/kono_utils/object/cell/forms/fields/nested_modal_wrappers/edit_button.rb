module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Bottone per la rimozione della riga nested
  class NestedModalWrappers::EditButton < KonoUtils::Object::Cell::Buttons::Edit


    def url_to
      "#"
    end

    def automatic_remove_options
      {}
    end

    ##
    # Nome della funzione da utilizzare quando viene cliccato il bottone
    def js_function_name
      @_fn_name ||= "edit_#{SecureRandom.hex(10)}"
    end

    def show(&block)
      super + render(&block).html_safe
    end

    ##
    # ID div in cui definire che l'elemento viene rimosso
    def edit_target
      options[:update_target]
    end


  end
end
