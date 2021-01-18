class Users::Cell::Forms::FieldSelector < KonoUtils::BaseObject::Cell::Forms::FieldSelector

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
      concept("cell/forms/fields/nested_modal_wrapper", model,
              layout: get_layout('nested_modal_wrappers'))
    else
      super
    end
  end


end