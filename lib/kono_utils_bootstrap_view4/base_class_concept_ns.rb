module KonoUtilsBootstrapView4
  module BaseClassConceptNs
    extend ActiveSupport::Concern

    class_methods do
      include ActiveSupport::Inflector

      ##
      # Metodo richiamato per restituire un  array di path in cui ricercare le view prima della ricerca delle altre view
      # all'interno della gemma o altro, serve per poter fare override di view anche senza la presenza della relativa
      # classe Cell overridata.
      def concept_prefix
        [Rails.application.root.join('app', 'concepts', tableize(self.name), 'view')]
      end

      def concept_ns(view)
        @_memo_concept ||= {}
        ns = "#{tableize(self.name)}/#{view}"

        unless @_memo_concept.key?(ns)
          if safe_constantize(ns.camelize)
            KonoUtilsBootstrapView4.configuration.logger.info { "TROVATA CLASSE PER : #{ns.camelize} --->>>" }
            @_memo_concept[ns] = ns
          else
            @_memo_concept[ns] = false
          end
        end

        if @_memo_concept[ns]
          return @_memo_concept[ns]
        else
          KonoUtilsBootstrapView4.configuration.logger.debug { "CLASSE OVERRIDE NON TROVATA PER : #{ns.camelize}" }

          "kono_utils/object/#{view}"
        end

      end

      ##
      # Ritorna il corretto layout per il componente, tenendo conto delle view con override
      def layout_ns(name)
        concept_ns(name).camelize.constantize
      end

    end
  end
end