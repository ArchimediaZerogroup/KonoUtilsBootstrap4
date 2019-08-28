class FileInputDownloadInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options)

    template.content_tag(:div, class: 'input-group') do

      tmp = ActiveSupport::SafeBuffer.new

      tmp << super
      tmp << div_button if options[:download_button]

      tmp
    end
  end

  def div_button
    template.content_tag(:div, class: 'input-group-append') do
      options[:download_button].show
    end
  end

end
