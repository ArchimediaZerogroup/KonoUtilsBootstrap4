module KonoUtils::Object::Cell::Forms::Fields # namespace
  # Classe contenitore del campo, serve per deviare nelle situazioni in cui non serve stampare un contenitore(id,_destroy) o campi hidden
  # il model qua avremo un KonoUtilsBootstrapView4::EditableField
  class Layout < Base

    def cell_column_class
      "col-md-12"
    end

    def show(&block)
      logger.debug { "LAYOUT => #{self.class.name}" }
      super
    end

  end
end