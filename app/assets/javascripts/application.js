//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $(document).on('input', '#search', function() {
    var value = $(this).val();
    if (!value) {
      $('#skills').empty();
      return;
    }
    
    $.get('/skills', {query: value}).done(function(data) {
      $('#skills').show();
    });
  });
  
  $(document).on('click', '.submit-button', function(e) {
    e.preventDefault();
    $(this).closest('form').submit();
  });
  
  $(document).on('click', '#skills li', function(e) {
    var $item = $(this);
    var id = $item.data('id');
    var val = $item.text();
    if ($.inArray(id, getPickIds()) != -1) {
      return;
    }
    var picksType = $('#picks').data('type');
    $('#picks').append('<span class="pick ' + picksType + '" data-id="' + id + '">' + val + '</span>')
    $('#pick-actions').removeClass('hide');
    $item.remove();
    if (picksType == 'deletable') {
      $.post('/user_skills', {skill_id: id}).done(function(data) {
      });
    }
  });
  
  $(document).on('click', '.pick.searchable', function(e) {
    $(this).remove();
    if (!$('.pick').length) {
      $('#pick-actions').addClass('hide');
    }
  });
  
  $(document).on('click', '.pick.deletable', function(e) {
    var $skill = $(this);
    var skillId = $skill.data('id');
    $.ajax({
      url: '/user_skills/' + skillId,
      type: 'DELETE',
      success: function(result) {
        $skill.remove();
      }
    });
  });
  
  $(document).on('click', '#search-button', function(e) {
    e.preventDefault();
    $('#skills').hide();
    var ids = getPickIds();
    $.get('/users', {skill_ids: ids, page: 1}).done(function(data) {
    });
  });
  
  var getPickIds = function() {
    return $.map($('.pick'), function(pick) {
      return $(pick).data('id');
    });
  };
  
  $(document).on('click', '.pagination a', function(e) {
    e.preventDefault();
    var href = $(this).attr('href');
    $.get(href).done(function(data) {
    });
  });
});