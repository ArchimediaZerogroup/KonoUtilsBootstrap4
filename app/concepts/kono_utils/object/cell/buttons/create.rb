module KonoUtils::Object::Cell::Buttons # namespace
  class Create < Base

    def url_to
      options[:url_to]||new_custom_polymorphic_path(model)
    end

    def specific_button_class
      "btn-success"
    end

    def button_title
      title_new
    end


    def show
      link_to(fa_icon("plus"), url_to, btn_opts)
    end

  end
end