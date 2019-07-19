module KonoUtilsBootstrapView4
  module BaseClassConceptNs
    extend ActiveSupport::Concern

    class_methods do
      include ActiveSupport::Inflector

      ##
      # Metodo richiamato per restituire un  array di path in ciu ricercare le view prima della ricerca delle altre view
      # all'interno della gemma o altro, serve per poter fare override di view anche senza la presenza della relativa
      # classe Cell overridata.
      def concept_prefix
        [Rails.application.root.join('app','concepts',tableize(self.name),'view')]
      end

      def concept_ns(view)

        ns = "#{tableize(self.name)}/#{view}"

        return ns if safe_constantize(ns.camelize)

        "kono_utils/object/#{view}"
      end
    end
  end
end