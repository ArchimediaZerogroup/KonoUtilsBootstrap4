module KonoUtils::Object::Cell # namespace
  ##
  # Options:
  # - url_to         -> Url verso dove mandare il bottone
  # - content        -> Contenuto del link del bottone
  # - button_options -> possibili opzioni per il bottone fra cui:
  #                     - class -> per la classe
  class Buttons::Base < Base


    # @return [String]
    def url_to
      options.fetch(:url_to, "#to_override_or_options-url_to")
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