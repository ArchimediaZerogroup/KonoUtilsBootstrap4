module KonoUtils::Object::Cell # namespace
  class Index::Header < Base

    def show
      content_for(:page_title, base_class.mnp)
      content_for(:side_title) do
        new_button new_custom_polymorphic_path(base_class) if policy(base_class.new).create?
      end
    end


  end
end