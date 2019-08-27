class UserPolicy < BaseEditingPolicy


  def editable_attributes

    contact_attributes = Pundit.policy!(user, Users::Contact.new).editable_attributes
    document_attributes = Pundit.policy!(user, Users::Document.new).editable_attributes

    super -
      [:category_id] +
      [
        :category,
        :tags,
        principal_contact: contact_attributes,
        contacts: contact_attributes,
        documents: document_attributes
      ]
  end

  def permitted_attributes
    contact_attributes = Pundit.policy!(user, Users::Contact.new).permitted_attributes
    document_attributes = Pundit.policy!(user, Users::Document.new).permitted_attributes
    super + [
      tag_ids: [],
      principal_contact_attributes: contact_attributes,
      contacts_attributes: contact_attributes,
      documents_attributes: document_attributes
    ]
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
