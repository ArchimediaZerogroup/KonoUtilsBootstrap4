module KonoUtils::Object::Cell::Buttons # namespace
  ##
  # Bottone per la struttura del collapse search
  # *Options*
  #   - collapsed_target -> identificativo del contenitore che devo espandere
  class CollapseSearch < Base

    def url_to
      options.fetch(:collapsed_target, '#')
    end

    def specific_button_class
      'btn-light'
    end

    def btn_opts(opts = {})
      {
        data: {toggle: "collapse"}
      }.merge(super)
    end

    def button_title
      I18n.t('kono_utils.bootstrap4.buttons.collapse_search.alt')
    end

    def button_content
      options.fetch(:content, fa_icon("search"))
    end

  end
end