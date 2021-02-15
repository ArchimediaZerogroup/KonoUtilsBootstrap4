class TempusDominusInput < SimpleForm::Inputs::Base
  def input(wrapper_options)

    template.content_tag(:div, class: "input-group date #{ has_errors? ? 'is-invalid' : ''}", data: { target_input: 'nearest'}, id: options[:date_time_picker_identifier]) do

      tmp = ActiveSupport::SafeBuffer.new
      merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
      tmp << @builder.text_field(attribute_name, merged_input_options)
      tmp << div_button

      tmp
    end
  end

  def input_html_options
    super.merge({class: 'form-control datetimepicker-input'})
  end

  def div_button
    template.content_tag(:div, class: 'input-group-append', data: {target: "##{options[:date_time_picker_identifier]}", toggle: 'datetimepicker'}) do
      span_table
    end
  end

  def span_table
    template.content_tag(:div, class: 'input-group-text') do
      icon_table
    end
  end

  def icon_remove
    "<i class='glyphicon glyphicon-remove'></i>".html_safe
  end

  def icon_table
    "<i class='fa fa-calendar'></i>".html_safe
  end
end
