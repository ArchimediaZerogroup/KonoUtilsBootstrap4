module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Nested < Base


    def show
      initialize_first_nested
      super
    end


    def initialize_first_nested
      form.object.send(model).build if form.object.send(model).empty?
    end

  end
end
