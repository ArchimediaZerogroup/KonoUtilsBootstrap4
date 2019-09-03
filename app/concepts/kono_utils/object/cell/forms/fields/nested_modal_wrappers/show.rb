module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Rappresenta la classe che renderizza il contenitore della versione di visualizzazione del dato
  ##
  class NestedModalWrappers::Show < NestedWrappers::Form

    # nella show dobbiamo renderizzare nascosti solo i campi dell'ID del destroy
    def form_attributes
      super.select { |v| v.name == :id or v.name == :_destroy }
    end

  end
end
