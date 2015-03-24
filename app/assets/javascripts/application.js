//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $(document).on('input', '#search', function() {
    $input = $(this);
    value = $input.val();
    if (!value) {
      $('#skills').empty();
      return;
    }
    
    $.get('skills', {query: value}).done(function(data) {
      $('#skills').show();
    });
  });
  
  $(document).on('click', '.submit-button', function(e) {
    e.preventDefault();
    $(this).closest('form').submit();
  });
  
  $(document).on('click', '#skills li', function(e) {
    $item = $(this);
    var id = $item.data('id');
    var val = $item.text();
    if ($.inArray(id, getPickIds()) == -1) {
      $item.remove();
      $('#picks').append('<span class="pick" data-id="' + id + '">' + val + '</span>')
      $('#pick-actions').removeClass('hide');
    }
  });
  
  $(document).on('click', '.pick', function(e) {
    $(this).remove();
    if (!$('.pick').length) {
      $('#pick-actions').addClass('hide');
    }
  });
  
  $(document).on('click', '#search-button', function(e) {
    e.preventDefault();
    $('#skills').hide();
    var ids = getPickIds();
  });
  
  var getPickIds = function() {
    return $.map($('.pick'), function(pick) {
      return $(pick).data('id');
    });
  };
});