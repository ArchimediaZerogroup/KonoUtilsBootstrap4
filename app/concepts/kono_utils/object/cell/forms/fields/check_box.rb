module KonoUtils::Object::Cell::Forms::Fields # namespace
  # Campo checkbox
  class CheckBox < Base

    def base_field_options
      super.merge(as: :boolean)
    end

  end
end