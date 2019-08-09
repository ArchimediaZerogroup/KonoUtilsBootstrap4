module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class DateField < DateTimeField

    def input_picker_format
      "L"
    end


  end
end
