class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :generate_categories


  private

  ##
  # Semplificazione in sviluppo di un possibile utente
  def current_user
    User.first || User.create(username: 'mario', surname: 'rossi', email: "example@tld.it")
  end


  def generate_categories
    #popolo le categorie se non presenti
    Category.create([{name: 'prima'}, {name: 'seconda'}, {name: 'terza'}]) if Category.count == 0
    ContactTipology.create([{name: 'Tel'}, {name: 'Cell'}, {name: 'Email'}]) if ContactTipology.count == 0
  end
end
