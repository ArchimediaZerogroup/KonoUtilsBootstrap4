module KonoUtils::Object::Cell::Forms::Fields # namespace
  class NestedWrappers::Forms::Layout < Base

    def container_id
      context[:container_id] # generato dalla cella Form, trovare sistema più bello? FIXME
    end

  end
end
