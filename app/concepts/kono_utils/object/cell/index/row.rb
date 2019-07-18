module KonoUtils::Object::Cell::Index # namespace
class Row < Base # class

  ##
  # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
  def print_column(record, field)
    record.send(field)
  end

  end
end