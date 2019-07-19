module KonoUtils::Object::Cell::Buttons # namespace
  class Delete < Base

    def url_to
      index_custom_polymorphic_path(model)
    end

    def show
      link_to fa_icon("trash fw"), url_to, method: :delete, data: {confirm: t(:are_you_sure)}, class: 'btn btn-danger btn-xs'
    end

  end
end