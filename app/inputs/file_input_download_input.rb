class FileInputDownloadInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options)

    template.content_tag(:div, class: 'input-group') do

      tmp = ActiveSupport::SafeBuffer.new

      tmp << super
      tmp << div_button { options[:download_button].show } if options[:download_button]
      tmp << div_button { options[:remove_checkbox].show } if options[:remove_checkbox]

      tmp
    end
  end

  def div_button
    template.content_tag(:div, class: 'input-group-append') do
      yield
    end
  end

end
