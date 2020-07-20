$(document).ready(function () {
  console.log('ok');
  $("body").on("error_during_container_deletion", '.kono_utils_single_nested_container',
    function (event, id_container, data, ajax_event) {
      console.log('non è stato cancellato il record per qualche motivo', event, id_container, data, ajax_event);
      alert("Implementare errori per" + id_container);
    }
  );
});
