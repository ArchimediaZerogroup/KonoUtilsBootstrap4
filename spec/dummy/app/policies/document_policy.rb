class DocumentPolicy < BaseEditingPolicy

  def editable_attributes
    super + [:doc]
  end

  def permitted_attributes
    super + [:doc]
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
