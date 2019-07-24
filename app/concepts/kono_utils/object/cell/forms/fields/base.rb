module KonoUtils::Object::Cell::Forms # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Fields::Base < Base

    def field_options
      base_field_options.merge(options[:field_options] || {})
    end


    def base_field_options
      out = {}

      out[:as] = :hidden if attribute_name.to_s == 'id'

      out
    end

  end
end
