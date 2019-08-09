module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class DateTimeField < Base


    def show(&block)

      bf = bf = ActiveSupport::SafeBuffer.new
      bf << form.input(attribute_name, field_options)


      bf << content_tag(:script, :type => "text/javascript") do
        raw "(function(){
              $('##{datetime_picker_identifier}').datetimepicker({
                date: moment('#{form.object.send(attribute_name)&.rfc2822}'),
                locale: '#{I18n.locale}',
                keepOpen: false,
                debug: false,
                format: '#{input_picker_format}'
              });
            })();
           "
      end

      bf
    end

    def input_picker_format
      "L LT"
    end

    def base_field_options
      super.merge(as: :tempus_dominus, date_time_picker_identifier: datetime_picker_identifier)
    end


    def datetime_picker_identifier
      @_unique ||= SecureRandom.uuid
    end


  end
end
