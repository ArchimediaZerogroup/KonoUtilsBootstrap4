class UserPolicy < BaseEditingPolicy


  def editable_attributes
    super - [:category_id] + [:category]
  end


  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

end
