Kaminari::Helpers::Tag.class_eval do
  def to_s(locals = {}) #:nodoc:
    @template.render(
      :partial => "../views/kaminari/#{@theme}#{self.class.name.demodulize.underscore}",
      :formats => [:html],
      :locals => @options.merge(locals)
    )
  end
end

# override per motivi inspiegabili
Kaminari::Helpers::Paginator.class_eval do
  def render(&block)
    @output_buffer<< instance_eval(&block).html_safe if @options[:total_pages] > 1
    @output_buffer
  end
end

# frozen_string_literal: true
Kaminari.configure do |config|
  # config.default_per_page = 25
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.params_on_first_page = false
end
