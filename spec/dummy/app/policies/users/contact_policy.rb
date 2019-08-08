class Users::ContactPolicy < ContactPolicy

  def editable_attributes
    super - [:user_id] + [:id]
  end

  def permitted_attributes
    super - [:user_id] + [:id]
  end

end
