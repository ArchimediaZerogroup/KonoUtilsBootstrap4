class Users::Contacts::Cell::Forms::Fields::Layout < KonoUtils::Object::Cell::Forms::Fields::Layout

  def cell_column_classes
    if form.object.principal?
      ["col-md-8", "offset-md-2"]
    else
      super
    end
  end

end
