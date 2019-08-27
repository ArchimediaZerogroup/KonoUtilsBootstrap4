module KonoUtils::Object::Cell::Forms::Fields # namespace
  # Classe contenitore del campo, serve per deviare nelle situazioni in cui non serve stampare un contenitore(id,_destroy) o campi hidden
  # il model qua avremo un KonoUtilsBootstrapView4::EditableField
  class Bases::Layout < Base

    def cell_column_classes
      ["col-md-12"]
    end

    def show(&block)
      logger.debug { "LAYOUT => #{self.class.name}" }
      super
    end

    private

    #ritorna la classe hidden da aggiungere nelle classi di layout nel caso il campo da renderizzare non sia da renderizzare
    def hidden_class
      model.is_hidden? ? ["kono_utils-hidden"] : []
    end


  end
end