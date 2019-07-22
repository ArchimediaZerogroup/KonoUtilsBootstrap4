class ContactTipologyPolicy  < BaseEditingPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
