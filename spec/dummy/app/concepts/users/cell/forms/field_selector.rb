class Users::Cell::Forms::FieldSelector < KonoUtils::Object::Cell::Forms::FieldSelector

  def get_field
    case model.name
    when :tags
      concept("cell/forms/fields/association", model, field_options: {as: :check_boxes},
              layout: get_layout('associations'))
    when :contacts
      concept("cell/forms/fields/nested_wrapper", model,
              context: {nested_layout: 'table_layout'},
              layout: get_layout('nested_wrappers'))
    when :documents
      concept("cell/forms/fields/nested_wrapper", model,
              context: {nested_layout: 'modal_layout'}, as_display_list: true,
              layout: get_layout('nested_wrappers'))
    else
      super
    end
  end


end