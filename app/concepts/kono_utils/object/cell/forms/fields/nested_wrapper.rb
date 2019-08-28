module KonoUtils::Object::Cell::Forms::Fields # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  # la base class di un nested diventa il modello della relazione
  #
  # ** Options:
  # - as_display_list -> Boolean che mi definisce se renderizzare come solo display la lista dei componenti
  class NestedWrapper < Base


    alias_method :parent_base_class, :base_class

    def base_class
      reflection_association.klass
    end


    def show(&block)
      initialize_first_nested
      super
    end

    def forms_container_layout
      layout = context[:nested_layout].blank? ? "layout" : context[:nested_layout]
      layout_ns("cell/forms/fields/nested_wrappers/forms_containers/#{layout}")
    end

    ##
    # Semplicemente se è un has_many ha multipli elementi, altrimenti no
    def has_multiple_elements?
      reflection_association.macro == :has_many
    end

    ##
    # Inizializza un nuovo record se necessario.
    # Si basa sulla reflection dell'associazione.
    # reflections supportate:
    # - has_one
    # - has_many
    def initialize_first_nested
      case reflection_association.macro
      when :has_one
        form.object.send("build_#{attribute_name}") if form.object.send(attribute_name).nil?
      when :has_many

        #   form.object.send(attribute_name).build if form.object.send(attribute_name).empty?
      else
        raise "not defined - #{reflection_association.macro}"
      end
    end


    def target_container_for_new_nested
      @_unique ||= SecureRandom.uuid
    end

    protected

    def reflection_association
      form.object.class.reflect_on_association(attribute_name)
    end

  end
end
