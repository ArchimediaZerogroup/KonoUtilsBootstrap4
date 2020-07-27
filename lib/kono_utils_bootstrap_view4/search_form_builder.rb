module KonoUtilsBootstrapView4
  class SearchFormBuilder < KonoUtils::SearchFormBuilder


    ##
    # Metodo che ritornerà il modello della ricerca BaseSearch.
    #
    def to_model
      self.search
    end


  end
end