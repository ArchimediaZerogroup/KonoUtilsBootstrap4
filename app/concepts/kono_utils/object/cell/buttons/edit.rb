module KonoUtils::Object::Cell::Buttons # namespace
  class Edit < Base

    def url_to
      options[:url_to]||edit_custom_polymorphic_path(model)
    end

    def show
      link_to fa_icon("pencil fw"), url_to, class: 'btn btn-primary btn-xs'
    end

  end
end