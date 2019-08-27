class Users::DocumentPolicy < DocumentPolicy
  def editable_attributes
    super - [:user_id] + [:id, :_destroy]
  end

  def permitted_attributes
    super - [:user_id] + [:id, :_destroy]
  end
end
