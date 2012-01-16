$(document).ready ->

	$.localScroll(duration: 500)

	$('.modal').colorbox(iframe:true, width:"800px", height: "600px", transition:"fade", fastIframe:false);


	$('.subscribe-link').unbind('click')
	$('.subscribe-link').click (event) ->
		$('#subscribe-email').focus()

		old = parseInt( $('#subscribe-box').css('width') )
		$('#subscribe-box').stop()
						   .animate({width:old+10}, 100)
						   .animate({width:old   }, 100)

		event.preventDefault()
		event.stopPropogation()