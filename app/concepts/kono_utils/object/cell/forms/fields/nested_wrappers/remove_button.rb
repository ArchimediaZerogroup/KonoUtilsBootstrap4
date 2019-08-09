module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Bottone per la rimozione della riga nested
  class NestedWrappers::RemoveButton < KonoUtils::Object::Cell::Buttons::Delete


    def url_to
      "#"
    end

    ##
    # Nome della funzione da utilizzare quando viene cliccato il bottone
    def js_function_name
      @_fn_name ||= "remove_#{SecureRandom.hex(10)}"
    end

    # def btn_opts(opts = {})
    #   custom_options = options.dig(:button_options) || opts
    #   opts = super({
    #                  onclick: "#{js_function_name}()",
    #                }.merge(custom_options))
    #
    #   opts.delete(:method)
    #   opts[:data].delete(:confirm)
    #
    #   opts
    # end

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
