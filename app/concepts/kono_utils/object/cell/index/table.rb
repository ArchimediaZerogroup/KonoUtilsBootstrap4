module KonoUtils::Object::Cell::Index # namespace
  class Table < Base




    def pagination
      paginate(model)
    end

    alias_method :pagination_top, :pagination
    alias_method :pagination_bottom, :pagination

  end
end