module KonoUtils::Object::Cell::Forms::Fields # namespace
  class FileField < Base

    def show(&block)
      form.input(attribute_name, field_options)
    end

    def base_field_options
      download_button = nil
      remove_checkbox = remove_checkbox
      if form.object.send(attribute_name).attached?
        download_button = concept("cell/buttons/download", form.object.send(attribute_name), button_options: { class: 'btn-outline-secondary' })
        if form.object.class.respond_to?(:attribute_purger_name)
          if form.object.respond_to?(form.object.class.attribute_purger_name(attribute_name))
            remove_checkbox = concept("cell/forms/fields/check_box", KonoUtilsBootstrapView4::EditableField.new(form.object.class.attribute_purger_name(attribute_name)))
          end
        end
      end
      super.merge({ as: :file_input_download, download_button: download_button, remove_checkbox: remove_checkbox })
    end

  end
end
