require 'kaminari/helpers/helper_methods'

module KonoUtils
  module BaseObject
    module Cell
      class Base < Trailblazer::Cell # class
        view_paths << "#{KonoUtilsBootstrapView4::Engine.root}/app/concepts"

        include Pundit
        include Kaminari::Helpers::HelperMethods
        include KonoUtilsBootstrapView4::ApplicationIconHelper
        include Kaminari::Cells

        ##
        # Helpers di controller
        def base_class
          context[:base_class] || (@_base_class ||= parent_controller.send(:base_class))
        end

        def new_custom_polymorphic_path(*base_class)
          parent_controller.send(:new_custom_polymorphic_path, *base_class)
        end

        def edit_custom_polymorphic_path(*rec)
          parent_controller.send(:edit_custom_polymorphic_path, *rec)
        end

        def index_custom_polymorphic_path(*rec)
          parent_controller.send(:index_custom_polymorphic_path, *rec)
        end

        def destroy_custom_polymorphic_path(*rec)
          parent_controller.send(:destroy_custom_polymorphic_path, *rec)
        end

        ##
        # Registra il contenuto con una chiave, e lo renderizza poi dove è più necessario
        # @param [String] name
        # @param [String] content
        # @param [Hash{null->null}] options
        # @param [Proc] block
        # @return [String]
        def content_for_layout(name, content = nil, options = {}, &block)
          context[:_view_layout_flow] ||= ActionView::OutputFlow.new
          if content || block_given?
            if block_given?
              options = content if content
              content = capture(&block)
            end
            if content
              content = content.to_s.html_safe
              options[:flush] ? context[:_view_layout_flow].set(name, content) : context[:_view_layout_flow].append(name, content)
            end
            nil
          else
            context[:_view_layout_flow].get(name).presence
          end
        end

        def content_for_layout?(name)
          context[:_view_layout_flow].get(name).present? rescue false
        end

        alias_method :legacy_concept, :concept

        # def concept(name, model = nil, options = {}, &block)
        def concept(name, *args, &block)
          legacy_concept(base_class.concept_ns(name), *args, &block)
        end

        delegates :base_class, :layout_ns

        # @return [Logger]
        def self.logger
          KonoUtilsBootstrapView4.configuration.logger
        end

        delegate :logger, to: :class

        def _prefixes
          base_class.concept_prefix + super + parent_controller.lookup_context.view_paths.collect(&:to_path)
        end

        def current_user
          context[:current_user]
        end

        def title_mod
          "#{t(:edit)} #{model.mn}"
        end

        def title_new
          "#{t(:new)} #{model.mn}"
        end

        def title_newa
          "#{t(:newa)} #{model.mn}"
        end

        def title_del
          "#{t(:del)} #{model.mn}"
        end

        def title_edit_g
          "#{t("edit_title_#{model_gender}", default: 'Modifica')} #{model.mn}"
        end

        def title_new_g
          "#{t("new_title_#{model_gender}", default: 'Nuovo')} #{model.mn}"
        end

        def title_del_g
          "#{t("del_title_#{model_gender}", default: 'Cancella')} #{model.mn}"
        end

        def title_show_g
          "#{t("show_title_#{model_gender}", default: 'Visualizza')} #{model.mn}"
        end

        def model_gender
          t("activerecord.modelgender.#{model.class.name.underscore.to_sym}", :default => :m).to_sym
        end

      end
    end
  end
end