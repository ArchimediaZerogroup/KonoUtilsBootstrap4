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
          attribute_purger_name = form.object.class.attribute_purger_name(attribute_name)
          if form.object.respond_to?(attribute_purger_name)

            label = form.object.class.han(attribute_purger_name,
                                          default: I18n.t('kono_utils.bootstrap4.forms.fields.file_field.purge_file.label'))

            remove_checkbox = concept("cell/forms/fields/check_box",
                                      KonoUtilsBootstrapView4::EditableField.new(attribute_purger_name),
                                      field_options: { label: label }
            )
          end
        end
      end
      super.merge({ as: :file_input_download, download_button: download_button, remove_checkbox: remove_checkbox })
    end

  end
end
