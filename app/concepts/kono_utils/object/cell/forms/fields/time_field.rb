module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class TimeField < DateTimeField

    def input_picker_format
      "LT"
    end


  end
end
