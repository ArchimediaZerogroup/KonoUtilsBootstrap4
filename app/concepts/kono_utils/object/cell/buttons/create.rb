module KonoUtils::Object::Cell::Buttons # namespace
  class Create < Base

    def url_to
      new_custom_polymorphic_path(model)
    end


    def btn_opts
      custom_options = options.dig(:button_options) || {}
      opts = {
        class: "btn btn-success btn-xs #{custom_options.delete(:class)}".split(' ').uniq.join(' ')
      }
      opts.merge!(custom_options)
      opts[:title] = title_new unless base_class.nil?
      opts
    end

    def show
      link_to(fa_icon("plus fw"), new_custom_polymorphic_path(base_class), btn_opts)
    end

  end
end