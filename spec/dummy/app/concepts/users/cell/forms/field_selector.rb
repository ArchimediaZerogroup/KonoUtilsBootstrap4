class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def show
    case model
    when :birthdate
      content_tag :span, 'ciao'
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes})
    else
      super
    end
  end


end