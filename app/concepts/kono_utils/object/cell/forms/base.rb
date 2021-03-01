module KonoUtils
  module Object
    module Cell
      # La cella base dei componenti della form
      # ha sempre un metodo form che viene ricevuto dal contesto della form
      class Forms::Base < Base

        # @return [SimpleForm::FormBuilder]
        def form
          context[:form]
        end

      end
    end
  end
end