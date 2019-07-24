class UserPolicy < BaseEditingPolicy


  def editable_attributes
    super - [:category_id] + [:category, :tags, contacts: Pundit.policy!(user, Contact.new).editable_attributes - [:user_id] + [:id]]
  end

  def permitted_attributes
    super + [tag_ids: [], contacts_attributes: Pundit.policy!(user, Contact.new).permitted_attributes - [:user_id] + [:id]]
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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
