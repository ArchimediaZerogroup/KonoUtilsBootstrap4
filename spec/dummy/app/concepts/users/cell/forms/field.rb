class Users::Cell::Forms::Field < KonoUtils::Object::Cell::Forms::Field

  def show
    case model
    when :birthdate
      content_tag :span,'ciao'
    when :category

    else
      super
    end
  end


end