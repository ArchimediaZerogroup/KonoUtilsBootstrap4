class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def get_field
    case model.name
    when :birthdate
      concept("cell/forms/fields/base", model, layout: layout_ns('cell/forms/fields/layout'))
    when :registration_datetime
      concept("cell/forms/fields/date_time", model, layout: layout_ns('cell/forms/fields/layout'))
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes},
              layout: layout_ns('cell/forms/fields/layout'))
    else
      super
    end
  end


end