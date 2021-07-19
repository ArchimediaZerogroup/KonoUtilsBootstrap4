module KonoUtilsBootstrapView4
  ##
  # PORO per l'esecuzione della cache a livello di istanza applicazione dei nomi di classe da utilizzare per i vari
  # componenti dei modelli
  class ConceptCacher
    #@return [Hash]
    attr_reader :_cache

    def initialize
      @_cache = {}
    end

    def clear
      @_cache = {}
    end

    ##
    # Ritorna il valore cachato, se non è presente, allora verrà dato in pasto allo yield l'istanza di cache, e sarà
    # chi la utilizzerà che si occuperà di salvare o meno il dato richiamato il metodo store passando il relativo valore da
    # salvare
    # @param [String] key
    # @return [Object] Cached result
    # @yieldparam [KonoUtilsBootstrapView4::ConceptCacher]
    def get(key)
      return @_cache[key] if @_cache.key?(key)
      yield(self)
      @_cache[key]
    end

    ##
    # Store del valore
    def store(key, value)
      @_cache[key] = value
    end

  end
end
