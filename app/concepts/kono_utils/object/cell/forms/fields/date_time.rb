module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class DateTime < Base


    def base_field_options
      super.merge(as: :tempus_dominus, date_time_picker_identifier: datetime_picker_identifier)
    end


    def datetime_picker_identifier
      @_unique ||= SecureRandom.uuid
    end


  end
end
