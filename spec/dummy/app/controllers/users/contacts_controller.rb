class Users::ContactsController < BaseEditingController

  def new
    super do|o|
      o.user=parent_object
      o
    end
  end

  def base_class
    Users::Contact
  end

  def parent_object
    User.find(params[:user_id])
  end

end