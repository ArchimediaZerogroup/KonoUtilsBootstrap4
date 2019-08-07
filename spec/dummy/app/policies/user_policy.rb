class UserPolicy < BaseEditingPolicy


  def editable_attributes

    contact_attributes = Pundit.policy!(user, Contact.new).editable_attributes - [:user_id] + [:id]

    super -
      [:category_id] +
      [
        :category,
        :tags,
        principal_contact: contact_attributes,
        contacts: contact_attributes
      ]
  end

  def permitted_attributes
    contact_attributes = Pundit.policy!(user, Contact.new).permitted_attributes - [:user_id] + [:id]
    super + [tag_ids: [], principal_contact_attributes: contact_attributes, contacts_attributes: contact_attributes]
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
