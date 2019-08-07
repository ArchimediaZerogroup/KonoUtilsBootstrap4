module KonoUtils::Object::Cell::Forms::Fields # namespace
  ##
  # Rappresenta la classe per la renderizzazione dell'header nel nested in modo da aggiungere o meno
  # la gestione del bottone di aggiunta
  class NestedWrappers::Header < Base

    delegates :parent_cell, :reflection_association
    delegates :parent_cell, :base_class

    def parent_cell
      context[:parent_cell]
    end

    ##
    # Controlla se dobbiamo renderizzare un bottone per fare la build di un nuovo record
    # @return [TrueClass|FalseClass]
    def build_new_nested?
      case reflection_association.macro
      when :has_one
        false
      when :has_many
        true
      else
        false
      end
    end

    ##
    # Funzione che si occupa di generare un nuovo ID da utilizzare nella richiesta del content
    # per sapere cosa estrapolare sucessivamente per jquery ed injettare nel target
    def new_id_content_selector
"ciao"
    end

  end
end
