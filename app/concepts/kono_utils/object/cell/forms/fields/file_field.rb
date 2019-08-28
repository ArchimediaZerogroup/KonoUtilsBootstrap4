module KonoUtils::Object::Cell::Forms::Fields # namespace
  class FileField < Base

    def show(&block)
      form.input(attribute_name, field_options)
    end

    def base_field_options
      download_button = nil
      if form.object.send(attribute_name).attached?
        download_button = concept("cell/buttons/download", form.object.send(attribute_name), button_options: {class: 'btn-outline-secondary'})
      end
      super.merge({as: :file_input_download, download_button: download_button})
    end

  end
end
