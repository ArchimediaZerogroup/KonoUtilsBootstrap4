class Users::Searches::Cell::Forms::FieldSelector < KonoUtils::BaseObject::Cell::Forms::FieldSelector

  def get_field
    case model.name
    when :from_date
      concept("cell/forms/fields/date_field", model, layout: get_layout('bases'))
    when :category_id
      concept("cell/forms/fields/collection", model,
              layout: get_layout('bases'),
              collection: policy_scope(Category).all.collect { |c| [c.name, c.id] }
      )
    else
      super
    end
  end


end