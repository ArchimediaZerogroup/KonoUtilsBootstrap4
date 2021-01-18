module KonoUtils
  module Object
    module Cell
      module Modals # namespace
        # Layout Standard del contenitore della modal
        class Containers::Layout < Base

          def modal_container_id
            context[:modal_container_id]
          end

        end
      end
    end
  end
end