module KonoUtils::Object::Cell # namespace
  ##
  # Classe che si occupa semplicemente di eseguire un update del contenuto quando abbiamo completato l'editazione ed
  # abbiamo avuto successo.
  # Lancerà l'evento per aggiornare il componente definito
  # - Options:
  #   modal_upgraded_target_container: String -> containere a cui è attaccata una funzione custom da lanciare
  class UpdateInject < Base


    ##
    # ID Container nella form iniziale, che dovrà essere aggiornato una volta completata l'operazione di edit, aggiornando
    # con lo show della cella il suo contenuto
    def modal_upgraded_target_container
      params.dig(:kono_utils, :modal_upgraded_target_container)
    end



  end
end