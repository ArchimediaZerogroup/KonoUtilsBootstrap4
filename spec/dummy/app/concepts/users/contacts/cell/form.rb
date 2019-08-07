class Users::Contacts::Cell::Form < KonoUtils::Object::Cell::Form

  def forms_options
    [model, url: user_contacts_path(model.user, model)]
  end


end