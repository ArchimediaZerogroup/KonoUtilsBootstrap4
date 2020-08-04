module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class DateField < DateTimeField

    def input_picker_format
      "L"
    end

    def input_value
      value = form.object.send(attribute_name)
      value.is_a?(Date) ? "date: moment('#{value&.rfc2822}')," : ''
    end

  end
end
