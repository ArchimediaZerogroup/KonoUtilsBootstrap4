module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields

          ##
          # Rappresenta la classe che renderizza il contenitore della versione di visualizzazione del dato
          ##
          class NestedModalWrappers::Show < NestedWrappers::Form

            # nella show dobbiamo renderizzare nascosti solo i campi dell'ID del destroy
            # FIXME serve questo codice?
            # def form_attributes
            #   super.select { |v| v.name == :id or v.name == :_destroy }
            # end

          end
        end
      end
    end
  end
end
