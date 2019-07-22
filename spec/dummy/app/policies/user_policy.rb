class UserPolicy < BaseEditingPolicy


  def editable_attributes
    super - [:category_id] + [:category, :tags] #+ [contacts: [:tipology, :val]]
  end

  def permitted_attributes
    super + [tag_ids: []]
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
