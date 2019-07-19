module KonoUtils::Object::Cell::Buttons # namespace
  class List < Base

    def url_to
      index_custom_polymorphic_path(model)
    end

    def show
      link_to fa_icon("list fw"), url_to, class: 'btn btn-default btn-xs'
    end

  end
end