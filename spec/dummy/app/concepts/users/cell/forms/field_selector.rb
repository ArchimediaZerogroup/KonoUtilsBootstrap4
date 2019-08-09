class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def get_field
    case model.name
    when :birthdate
      concept("cell/forms/fields/date_field", model, layout: layout_ns('cell/forms/fields/layout'))
    when :birttime
      concept("cell/forms/fields/time_field", model, layout: layout_ns('cell/forms/fields/layout'))
    when :registration_datetime
      concept("cell/forms/fields/date_time_field", model, layout: layout_ns('cell/forms/fields/layout'))
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes},
              layout: layout_ns('cell/forms/fields/layout'))
    else
      super
    end
  end


end