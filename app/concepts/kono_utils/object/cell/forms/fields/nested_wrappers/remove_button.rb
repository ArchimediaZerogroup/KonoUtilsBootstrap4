module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Bottone per la rimozione della riga nested
  # *Options:*
  # - ajax_remove: [Boolean] -> indica se vogliamo che venga veramente cancellato il record
  class NestedWrappers::RemoveButton < KonoUtils::Object::Cell::Buttons::Delete


    def url_to
      if ajax_remove?
        destroy_custom_polymorphic_path(model, format: :json)
      else
        "#"
      end
    end

    ##
    # Controlla se questo record deve essere cancellato o meno via ajax
    # @return [TrueClass, FalseClass]
    def ajax_remove?
      !!options.fetch(:ajax_remove, false)
    end

    def automatic_remove_options
      if ajax_remove?
        super.merge(remote: true)
      else
        {}
      end
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
