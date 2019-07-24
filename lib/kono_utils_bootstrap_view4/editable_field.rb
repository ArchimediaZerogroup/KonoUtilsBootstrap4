module KonoUtilsBootstrapView4

  ##
  # PORO che si occupa di gestire un campo da editare.
  # questo serve per poter gestire le casistiche provenienti dagli editable attributes, che consistono in semplisy symbols
  # o in hash che rappresentano le relazioni
  class EditableField


    def initialize(f)
      @field = f
    end

  end
end