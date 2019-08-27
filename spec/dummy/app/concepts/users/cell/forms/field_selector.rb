class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def get_field
    case model.name
    when :birthdate
      concept("cell/forms/fields/date_field", model, layout: get_layout('bases'))
    when :birttime
      concept("cell/forms/fields/time_field", model, layout:get_layout('bases'))
    when :registration_datetime
      concept("cell/forms/fields/date_time_field", model, layout: get_layout('bases'))
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes},
              layout: get_layout('associations'))
    when :contacts
      concept("cell/forms/fields/nested_wrapper", model,
              context: {nested_layout: 'table_layout'},
              layout: get_layout('nested_wrappers'))
    else
      super
    end
  end


end