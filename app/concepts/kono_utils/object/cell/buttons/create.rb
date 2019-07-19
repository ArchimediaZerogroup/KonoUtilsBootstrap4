module KonoUtils::Object::Cell::Buttons # namespace
  class Create < Base

    def url_to
      new_custom_polymorphic_path(model)
    end

    def show
      btn_opts = {class: 'btn btn-success btn-xs'}.merge(options.dig(:button_options) || {})
      btn_opts[:title] = title_new unless base_class.nil?

      link_to(fa_icon("plus fw"), new_custom_polymorphic_path(base_class), btn_opts)
    end

  end
end