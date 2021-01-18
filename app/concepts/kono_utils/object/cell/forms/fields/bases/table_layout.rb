module KonoUtils
  module Object
    module Cell
      module Forms # namespace
        module Fields
          module Bases # namespace
            # Classe contenitore del campo, serve per deviare nelle situazioni in cui non serve stampare un contenitore(id,_destroy) o campi hidden
            # il model qua avremo un KonoUtilsBootstrapView4::EditableField
            class TableLayout < Layout

              def cell_column_classes
                []
              end

            end
          end
        end
      end
    end
  end
end