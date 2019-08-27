class Users::DocumentsController < BaseEditingController

  def new
    super do|o|
      o.user=parent_object
      o
    end
  end

  def base_class
    Users::Document
  end

  def parent_object
    User.find(params[:user_id])
  end

end