class ContactPolicy < BaseEditingPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
