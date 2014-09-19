var ready = function() {
	/*============================================
	Footer pop Weixin
	==============================================*/
	$('#icon-weixin2').popover({
      html: true,
      placement: 'top',
      title: '扫描二维码加微信',
      content: function(){
        return $('#weixin-qrcode2').html();
      }
  });
	/*============================================
	Page Preloader
	==============================================*/
	
	$(window).load(function(){
		$('#page-loader').fadeOut(500,function(){
			//loadGmap();
		});
	})
	
	/*============================================
	Header
	==============================================*/
	
	$('#home').height($(window).height()+50);
	
	$.backstretch('/assets/header-bg3.jpg');
	
	$(window).scroll( function() {
		var st = $(this).scrollTop(),
			wh = $(window).height(),
			sf = 1.2 - st/(10*wh);
		
		$('.backstretch img').css({ 
			'transform' : 'scale('+sf+')', 
			'-webkit-transform' : 'scale('+sf+')'
		});
		
		$('#home .container').css({ 'opacity' : (1.4 - st/400) });
		
		if($(window).scrollTop() > ($(window).height()+50)){
			$('.backstretch').hide();
		}else{
			$('.backstretch').show();
		}
		
	});
	
	var st = $(this).scrollTop(),
		wh = $(window).height(),
		sf = 1.2 - st/(10*wh);

	$('.backstretch img').css({ 
		'transform' : 'scale('+sf+')', 
		'-webkit-transform' : 'scale('+sf+')'
	});

	$('#home .container').css({ 'opacity' : (1.4 - st/400) });

	
	/*============================================
	Navigation Functions
	==============================================*/
	if ($(window).scrollTop()< ($(window).height()-50)){
		$('#main-nav').removeClass('scrolled');
	}
	else{
		$('#main-nav').addClass('scrolled');    
	}

	$(window).scroll(function(){
		if ($(window).scrollTop()< ($(window).height()-50)){
			$('#main-nav').removeClass('scrolled');
		}
		else{
			$('#main-nav').addClass('scrolled');    
		}
	});
	
	/*============================================
	ScrollTo Links
	==============================================*/
	$('a.scrollto').click(function(e){
		$('html,body').scrollTo(this.hash, this.hash, {gap:{y:-70}});
		e.preventDefault();

		if ($('.navbar-collapse').hasClass('in')){
			$('.navbar-collapse').removeClass('in').addClass('collapse');
		}
	});

	/*============================================
	Skills
	==============================================*/
	$('.skills-item').each(function(){
		var perc = $(this).find('.percent').data('percent');

		$(this).data('height',perc);
	})
	
	$('.touch .skills-item').each(function(){
		$(this).css({'height':$(this).data('height')+'%'});
	})
	
	$('.touch .skills-bars').css({'opacity':1});
		
	/*============================================
	Project thumbs - Masonry
	==============================================*/

	
	/*============================================
	Filter Projects
	==============================================*/

	/*============================================
	Project Preview
	==============================================*/

	/*============================================
	Twitter
	==============================================*/
	
	/*============================================
	Contact Map
	==============================================*/
	
	/*============================================
	Waypoints Animations
	==============================================*/
	$('#skills').waypoint(function(){
	
		$('.skills-item').each(function(){
			$(this).css({'height':$(this).data('height')+'%'});
		})
		
		$('.skills-bars').css({'opacity':1});
		
	},{offset:'40%'});
	
	$('.scrollimation').waypoint(function(){
		$(this).addClass('in');
	},{offset:'90%'});
	
	/*============================================
	Resize Functions
	==============================================*/
	
	$(window).resize(function(){
		$('#home').height($(window).height()+50);
		
		scrollSpyRefresh();
		waypointsRefresh();
	});
	
	/*============================================
	Refresh scrollSpy function
	==============================================*/
	function scrollSpyRefresh(){
		setTimeout(function(){
			$('body').scrollspy('refresh');
		},1000);
	}
	
	/*============================================
	Refresh waypoints function
	==============================================*/
	function waypointsRefresh(){
		setTimeout(function(){
			$.waypoints('refresh');
		},1000);
	}
};

/*======================================下面是burbolinks改造后的调用方法===============================================*/
//#turbolinks style
$(document).ready(ready);
$(document).on('page:load', ready);
