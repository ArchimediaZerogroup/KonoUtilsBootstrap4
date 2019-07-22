module KonoUtils::Object::Cell # namespace
  class Index::Base < Base


    def table_columns
      policy(base_class.new).show_attributes
    end

  end
end