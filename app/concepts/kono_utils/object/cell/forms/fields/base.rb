module KonoUtils::Object::Cell::Forms # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Fields::Base < Base

    def field_options
      options[:field_options] || {}
    end

  end
end
