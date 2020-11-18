module KonoUtils::Object::Cell::Forms::Fields # namespace
  # Campo per readonly
  class ReadOnly < Base


    def field_options
      super.merge({disabled: true})
    end

    def show(&block)
      render "forms/fields/base"
    end

  end
end
