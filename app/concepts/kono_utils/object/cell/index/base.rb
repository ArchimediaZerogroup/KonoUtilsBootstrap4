module KonoUtils::Object::Cell # namespace
  class Index::Base < Base


    def table_columns
      policy(base_class.new).permitted_attributes
    end

  end
end