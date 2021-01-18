class Users::Documents::Cell::Form < KonoUtils::Object::Cell::Form

  def forms_options
    [[model.user, model], _form_options]
  end


end