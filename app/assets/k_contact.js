ready = function() {
	$('#contact-form').submit(function() {
		var buttonWidth=$('#contact-form button').width();
		
		var buttonCopy = $('#contact-form button').html(),
			errorMessage = $('#contact-form button').data('error-message'),
			sendingMessage = $('#contact-form button').data('sending-message'),
			okMessage = $('#contact-form button').data('ok-message'),
			hasError = false;
		
		$('#contact-form button').width(buttonWidth);
		$('#contact-form .error-message').remove();
		
		$('.requiredField').each(function() {
			if($.trim($(this).val()) == '') {
				var errorText = $(this).data('error-empty');
				$(this).parents('.field-wrap').append('<span class="error-message" style="display:none;">'+errorText+'.</span>').find('.error-message').fadeIn('fast');
				$(this).addClass('inputError');
				hasError = true;
			} else if($(this).is("input[type='url']") || $(this).attr('name')==='url') {
				var urlReg = /^((http(s)?:\/\/)?([\w-]+\.)+[\w-]{2,4})?$/;
				if(!urlReg.test($.trim($(this).val()))) {
					var invalidUrl = $(this).data('error-invalid');
					$(this).parents('.field-wrap').append('<span class="error-message" style="display:none;">'+invalidUrl+'.</span>').find('.error-message').fadeIn('fast');
					$(this).addClass('inputError');
					hasError = true;
				}
			} else if($(this).is("input[type='mobile_phone']") || $(this).attr('name')==='mobile_phone') {
				var phoneReg = /^(1[35789]\d{9})?$/;
				if(!phoneReg.test($.trim($(this).val()))) {
					var invalidPhone = $(this).data('error-invalid');
					$(this).parents('.field-wrap').append('<span class="error-message" style="display:none;">'+invalidPhone+'.</span>').find('.error-message').fadeIn('fast');
					$(this).addClass('inputError');
					hasError = true;
				}
			}
		});
		
		if(hasError) {
			$('#contact-form button').html('<i class="fa fa-times"></i>'+errorMessage);
			setTimeout(function(){
				$('#contact-form button').html(buttonCopy);
				$('#contact-form button').width('auto');
			},2000);
		}
		else {
			$('#contact-form button').html('<i class="fa fa-spinner fa-spin"></i>'+sendingMessage);
			
			var formInput = $(this).serialize();
			$.post($(this).attr('action'),formInput, function(data){
				$('#contact-form button').html('<i class="fa fa-check"></i>'+okMessage);
				$('#contact-form button').attr('disabled','disabled');
				$('.requiredField').each(function() {
					$(this).val('');
				});
				setTimeout(function(){
					$('#contact-form button').html(buttonCopy);
					$('#contact-form button').width('auto');
					$('#contact-form button').removeAttr('disabled');
				}, 6000);
				
			});
		}
		
		return false;	
	});
};

//#turbolinks style
$(document).ready(ready);
$(document).on('page:load', ready);