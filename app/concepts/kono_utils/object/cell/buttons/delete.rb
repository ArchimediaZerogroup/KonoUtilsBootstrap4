module KonoUtils::Object::Cell::Buttons # namespace
  class Delete < Base

    def url_to
      options[:url_to] || index_custom_polymorphic_path(model)
    end

    def specific_button_class
      'btn-danger'
    end

    def btn_opts(opts = {})
      custom_options = options.dig(:button_options) || opts
      super({
              method: :delete,
              data: {confirm: t(:are_you_sure)},
            }.merge(custom_options))
    end


    def show(&block)
      link_to fa_icon("trash fw"), url_to, btn_opts
    end

  end
end