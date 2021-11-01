function run_after_load(){
  set_category_id();
  setTimeout(hide_alert, 3000);
}

function initialize_event(){
  $(".category_button").on( "click", function() {
    set_category_id();
  });
}

function set_category_id(){
  var active_category_id = $('#category-tab').find('.active').data('id');
  $('.sub_category_form').find('input[name=category_id]').val(active_category_id);
}

function hide_alert(){
  $('#alert_message').addClass( "hide" );
}

$( document ).ready(function() {
  initialize_event();
  run_after_load();
});
