module KonoUtils::Object::Cell::Index # namespace
class SideTitle < Base

    def show
      new_button new_custom_polymorphic_path(base_class) if policy(base_class.new).create?
    end

  end
end