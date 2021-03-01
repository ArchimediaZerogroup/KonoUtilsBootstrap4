class Users::Cell::Searches::Form < KonoUtils::Object::Cell::Searches::Form

  def submit_buttons(form_builder:)
    super + ["Contenuto da mettere nei bottoni della search"]
  end

end