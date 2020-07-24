module KonoUtilsBootstrapView4
  class SearchFormBuilder < KonoUtils::SearchFormBuilder


    ##
    # Metodo che ritornerà il modello della ricerca BaseSearch.
    #
    def to_modal
      self.search
    end


  end
end