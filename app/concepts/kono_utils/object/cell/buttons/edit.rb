module KonoUtils::Object::Cell::Buttons # namespace
  class Edit < Base

    def url_to
      options[:url_to]||edit_custom_polymorphic_path(model)
    end

    def specific_button_class
      'btn-primary'
    end

    def show
      link_to fa_icon("pencil fw"), url_to, btn_opts
    end

  end
end