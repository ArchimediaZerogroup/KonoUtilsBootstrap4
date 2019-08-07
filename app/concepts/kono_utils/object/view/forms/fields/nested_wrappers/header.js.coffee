$ ->
  $('body').on 'ajax:success', '.kono_utils_append_nested_object', (event)->
    console.log(arguments);
    $()
