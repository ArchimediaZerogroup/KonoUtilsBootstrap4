class Users::Documents::Cell::Form < KonoUtils::BaseObject::Cell::Form

  def forms_options
    [[model.user, model], _form_options]
  end


end