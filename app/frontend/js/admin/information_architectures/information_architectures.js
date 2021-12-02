function run_after_load(){
  set_category_id();
  setTimeout(hide_alert, 3000);
}

function initialize_event(){
  $(".category_button").on( "click", function() {
    target = $(event.target)
    set_category_id( target);
  });

  $(".category_change").on( "click", function() {
    target = $(event.currentTarget);
    category_id = target.data('id');
    category_name = target.data('name');
    fill_change_modal(category_id, category_name);
  });
}

function set_category_id( target){
  if(typeof target !== "undefined"){
    $(".categories_block").find(".nav-link").removeClass("active");
    target.addClass( "active" );
  }

  var active_category_id = $('#category-tab').find('.active').data('id');
  $('.sub_category_form').find('input[name=category_id]').val(active_category_id);
}

function fill_change_modal(id, name){
  modal = $("#categoryChange");
  action = modal.data('path') + '/' + id;
  modal.find('form').attr('action', action);
  modal.find('input[name=name]').val(name);
  modal.find('input[name=id]').val(id);
  modal.find('#categoryChangeLabel').html('Change ' + name + ' category?');
}

function hide_alert(){
  $('#alert_message').addClass( "hide" );
}

$( document ).ready(function() {
  initialize_event();
  run_after_load();
});
