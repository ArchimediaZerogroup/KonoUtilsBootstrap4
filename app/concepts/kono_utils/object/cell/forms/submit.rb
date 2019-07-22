module KonoUtils::Object::Cell::Forms # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Submit < Base

    def btn_status_class
      'btn-primary'
    end

    def btn_options
      {
        class: btn_status_class,
        :disable_with => t('wait', default: 'Wait...')
      }
    end

    def show
      form.button :submit, btn_options
    end


  end
end