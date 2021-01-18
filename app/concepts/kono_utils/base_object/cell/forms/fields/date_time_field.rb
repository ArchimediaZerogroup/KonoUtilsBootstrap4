module KonoUtils
  module BaseObject
    module Cell
      module Forms # namespace
        module Fields
          # La cella base dei componenti della form contiene sempre la form come model
          class DateTimeField < Base

            def show(&block)

              bf = bf = ActiveSupport::SafeBuffer.new
              bf << form.input(attribute_name, field_options)

              bf << content_tag(:script, :type => "text/javascript") do
                raw "(function(){
              $('##{datetime_picker_identifier}').datetimepicker({
                #{ input_value }
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

            ##
            # Carica il valore nel js per poterlo avere precaricato nel campo
            #
            def input_value
              value = form.object.send(attribute_name)
              value.is_a?(DateTime) ? "date: moment('#{value&.rfc2822}')," : ''
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
      end
    end
  end
end
