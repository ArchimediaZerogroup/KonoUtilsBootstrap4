module KonoUtils::Object::Cell # namespace
  class Buttons::Base < Base


    def url_to
      "#to_override"
    end

    def specific_button_class
      nil
    end

    def button_title
      nil
    end


    def btn_opts(opts = {})
      custom_options = options.dig(:button_options) || opts
      opts = {
        class: "btn #{specific_button_class} btn-xs #{custom_options.delete(:class)}".split(' ').uniq.join(' '),
        id: unique_dom_id
      }
      opts.merge!(custom_options)
      opts[:title] = button_title unless base_class.nil?
      opts
    end

    private

    def unique_dom_id
      @_unique_dom_id ||= SecureRandom.uuid
    end

    def fa_icon(icon, text: nil)
      icon = content_tag(:i, nil, class: "fas fa-#{icon}")
      elements = [icon]
      unless text.blank?
        elements << text
        elements.reverse!
      end

      safe_join(elements, " ")
    end

  end
end