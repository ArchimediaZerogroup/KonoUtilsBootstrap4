class Users::ContactPolicy < ContactPolicy

  def editable_attributes
    super + [:user_id]
  end

  def permitted_attributes
    super - [:user_id] + [:id, :_destroy]
  end

end
