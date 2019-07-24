class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def get_field
    Rails.logger.debug model



    case model
    when :birthdate
      content_tag :span, 'ciao2'
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes})
    else
      super
    end
  end


end