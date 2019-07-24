module KonoUtilsBootstrapView4

  ##
  # PORO che si occupa di gestire un campo da editare.
  # questo serve per poter gestire le casistiche provenienti dagli editable attributes, che consistono in semplisy symbols
  # o in hash che rappresentano le relazioni
  class EditableField


    def initialize(f)
      @field = f
    end


    ##
    # Restituisce il symbol che rappresenta il campo da editare
    #
    def name

      if @field.is_a?(Hash)
        @field.keys.first
      else
        @field.to_sym
      end

    end

    ##
    # Controlla se il campo è di tipo nested (un hash con chiave ed una serie di campi interni)
    def is_nested?
      @field.is_a?(Hash)
    end

    ##
    # Nei casi di campi nested, questo metodo restituisce un array di campi interni, normalizzati a EditableField
    def inner_fields
      is_nested? ? self.class.editable_fields_to_field_array(@field[name]) : []
    end


    def self.editable_fields_to_field_array(attributes)
      attributes.collect do |s|

        if s.is_a?(Hash)
          s.collect {|k, v| KonoUtilsBootstrapView4::EditableField.new({k => v})}
        else
          KonoUtilsBootstrapView4::EditableField.new(s)
        end

      end.flatten
    end

  end
end