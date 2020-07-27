module KonoUtils::Object::Cell::Buttons # namespace
  ##
  # Bottone per la struttura del collapse search
  # *Options*
  #   - collapsed_target -> identificativo del contenitore che devo espandere
  class ResetSearch < Base

    def url_to
      options[:url_to] || index_custom_polymorphic_path(model)
    end

    def specific_button_class
      "btn-secondary"
    end

    def show
      link_to fa_icon("times"), url_to, btn_opts
    end

  end
end