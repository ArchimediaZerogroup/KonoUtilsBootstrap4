class Users::Cell::Forms::Field < KonoUtils::Object::Cell::Forms::Field

  def show
    case model
    when :birthdate
      content_tag :span,'ciao'
    when :tags

      form.association model, as: :check_boxes

    else
      super
    end
  end


end