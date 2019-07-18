module UsersHelper

  def editing_form_print_field(form, field)
    case field
    when :birthdate
      form.input field, as: :bs_datepicker, :inject_js => true
    when :registration_datetime
      form.input field, as: :bs_datetimepicker, :inject_js => true
    when :birttime
      form.input field, as: :bs_timepicker, :inject_js => true
    else
      super
    end
  end


  def edit_button(path)
    link_to fa_icon("pencil fw marino", text: "Override Helper"), path, class: 'btn btn-primary btn-xl'
  end

end