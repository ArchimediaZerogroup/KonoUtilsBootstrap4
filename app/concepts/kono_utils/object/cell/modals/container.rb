module KonoUtils::Object::Cell # namespace
  ##
  # Contenitore principale modal, come Model riceve un oggetto che rappresente il body da renderizzare che deve rispondere
  # a to_s per restituire il contenuto del body e metodi to_footer e to_header per il contenuto degli altri componenti
  # se l'oggetto non risponde a tali metodi, non visualizziamo nemmeno il componente header o footer.
  class Modals::Container < Base


    ##
    # Id per identificare il container che raggruppa campi e bottone per cancellare
    def modal_container_id
      @_unique ||= context[:modal_container_id] = SecureRandom.uuid
    end

    def have_header?
      model.respond_to? :to_header
    end

    def have_footer?
      model.respond_to? :to_footer
    end

  end
end