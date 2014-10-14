ready = function() {
  $('#search-form').submit(function() {
    
    var buttonCopy = $('#search-form button').html(),
      errorMessage = $('#search-form button').data('error-message'),
      sendingMessage = $('#search-form button').data('sending-message'),
      okMessage = $('#search-form button').data('ok-message'),
      hasError = false;
    
    $('#search-form .error-message').remove();
    
    $('#search-form .requiredField').each(function() {
      if($.trim($(this).val()) == '') {
        var errorText = $(this).data('error-empty');
        $(this).parent().append('<span class="error-message" style="display:none;">'+errorText+'.</span>').find('.error-message').fadeIn('fast');
        $(this).addClass('inputError');
        hasError = true;
      } else if($(this).is("input[type='url']") || $(this).attr('name')==='url') {
        var urlReg = /^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/;
        if(!urlReg.test($.trim($(this).val()))) {
          var invalidUrl = $(this).data('error-invalid');
          $(this).parent().append('<span class="error-message" style="display:none;">'+invalidUrl+'.</span>').find('.error-message').fadeIn('fast');
          $(this).addClass('inputError');
          hasError = true;
        }
      }
    });
    
    if(hasError) {
      $('#search-form button').html('<i class="fa fa-times"></i>'+errorMessage);
      setTimeout(function(){
        $('#search-form button').html(buttonCopy);
      },2000);
    } else {
      return true;
    }
    
    return false; 
  });
};

//#turbolinks style
$(document).ready(ready);
$(document).on('page:load', ready);