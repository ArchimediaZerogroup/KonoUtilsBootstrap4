module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        module Fields
          #
          # Classe per la gestione del campo Enum, semplicemente estendendo la collection, ed estrapolando automaticamente
          # i valori della select e relative traduzioni
          class Enum < Collection
            include KonoUtils::ApplicationEnumHelper

            ##
            # Ritorna la rappresentazione da utilizzare per stampare la select dell'enum
            # @return [Hash]
            def collection
              enum_collection(form.object.class, model.name)
            end

            def show(&block)
              render "forms/fields/collection"
            end

          end
        end
      end
    end
  end
end
