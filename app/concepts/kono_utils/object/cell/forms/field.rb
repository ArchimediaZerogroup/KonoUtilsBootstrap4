module KonoUtils::Object::Cell::Forms # namespace
  # La cella base dei componenti della form contiene sempre la form come model
  class Field < Base

    ##
    # Questa funzione serve per essere sovrascritta nell'helper specializzato del controller
    # e quindi stampare un determinato campo in modo differente
    # si occupa anche di gestire i campi provenienti dalla policy nel caso siano a più livelli con i nested
    # prendiamo in considerazione la situazione con has_many :campo=>[] o con :campo=>[:ciao,:pippo,:pluto]
    def show
      if model.is_a?(Hash)
        #devo nestarlo
        bf = ActiveSupport::SafeBuffer.new

        model.each do |k, v|
          if v.length == 0
            #caso in cui è un elemento normale, ma che ha una selezione multipla
            bf.safe_concat(concept(base_class.concept_ns("cell/forms/field"), k).to_s)
          else
            #caso in cui potremmo essere in un campo di multipli elementi con vari valori ognuno
            bf.safe_concat(concept(base_class.concept_ns("cell/forms/fields/nested"), k, fields: v).to_s)
          end
        end
        bf
      else
        # decidiamo se renderizzare un'associazione o meno
        if form.object.class.reflect_on_association(model)
          concept(base_class.concept_ns("cell/forms/fields/association"), model)
        else
          concept(base_class.concept_ns("cell/forms/fields/base"), model)
        end
      end
    end


      ##
      # Questa funzione può essere sovrascritta per gestire in modo personale la renderizzazine dei nested attributes
      # * *Attributes*  :
      #   - form              -> form di formtastic
      #   - contenitore       -> campo principale
      #   - campi             -> i campi interni
      # def nest_editing_form_print_field(form, contenitore, campi)
      #   form.simple_fields_for contenitore do |item|
      #     item.inputs :name => t(".#{form.object.mn}.#{contenitore}", :default => contenitore.to_s.camelcase) do
      #       bf = ActiveSupport::SafeBuffer.new
      #       campi.each do |c|
      #         bf << editing_form_print_field(item, c)
      #       end
      #       bf
      #     end
      #   end
      # end

  end
end