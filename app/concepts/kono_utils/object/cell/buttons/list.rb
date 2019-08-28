module KonoUtils::Object::Cell::Buttons # namespace
  class List < Base

    def url_to
      options[:url_to] || index_custom_polymorphic_path(model)
    end

    def specific_button_class
      'btn-link'
    end

    def show
      link_to fa_icon("list fw"), url_to, btn_opts
    end

  end
end