module KonoUtils::Object::Cell # namespace
  class Form < Base


    def forms_options
      [model]
    end


    def form_attributes
      policy(model).permitted_attributes
    end

    def cell_column_class(field)
      "col-md-12"
    end
  end
end