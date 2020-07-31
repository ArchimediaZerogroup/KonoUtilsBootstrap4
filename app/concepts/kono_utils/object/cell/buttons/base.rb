module KonoUtils::Object::Cell # namespace
  ##
  # Options:
  # - content -> Contenuto del link del bottone
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

    def button_size
      "btn-sm"
    end


    def btn_opts(opts = {})
      custom_options = options.dig(:button_options) || opts
      opts = {
        class: "btn #{specific_button_class} #{button_size} #{custom_options.delete(:class)}".split(' ').uniq.join(' '),
        id: unique_dom_id
      }
      opts.merge!(custom_options)
      opts[:title] = button_title unless base_class.nil?
      opts
    end

    def show(&block)
      link_to button_content, url_to, btn_opts
    end

    # @return [String] - contenuto del bottone/link
    def button_content
      options.fetch(:content, model.try(:to_s) || "options[:content]")
    end

    private

    def unique_dom_id
      @_unique_dom_id ||= SecureRandom.uuid
    end


  end
end