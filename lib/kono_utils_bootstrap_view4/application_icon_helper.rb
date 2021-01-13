module KonoUtilsBootstrapView4
  module ApplicationIconHelper

    ##
    # Funzione clonata da una gemma, le fontawesome lo stiamo già impostando con webpack
    def icon(style, name, text = nil, html_options = {})
      text, html_options = nil, text if text.is_a?(Hash)

      content_class = "#{style} fa-#{name}"
      content_class << " #{html_options[:class]}" if html_options.key?(:class)
      html_options[:class] = content_class

      html = content_tag(:i, nil, html_options)
      html << ' ' << text.to_s unless text.blank?
      html
    end

    def fa_icon(icon, text: nil, solid_regular:"s")
      icon = content_tag(:i, nil, class: "fa#{solid_regular} fa-#{icon} fa-fw")
      elements = [icon]
      unless text.blank?
        elements << text
        elements.reverse!
      end

      safe_join(elements, " ")
    end


  end
end
