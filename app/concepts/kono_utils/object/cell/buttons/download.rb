module KonoUtils::Object::Cell::Buttons # namespace
  class Download < Base

    def url_to
      options[:url_to] || url_for(model)
    end

    def specific_button_class
      'btn-light'
    end

    def show
      link_to fa_icon("download",text: I18n.t('kono_utils.bootstrap4.buttons.download.alt')), url_to, btn_opts
    end

  end
end