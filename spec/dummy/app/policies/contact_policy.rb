class ContactPolicy < BaseEditingPolicy


  def editable_attributes
    super - [:contact_tipology_id] + [:contact_tipology]
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
