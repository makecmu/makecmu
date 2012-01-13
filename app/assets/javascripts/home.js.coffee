$(document).ready ->

	$.localScroll(duration: 500)

	$('.modal').colorbox(iframe:true, width:"80%", height:"80%", transition:"fade");

	$('.subscribe-link').click (event) ->
		$('#subscribe-email').focus()

		old = parseInt( $('#subscribe-box').css('width') )
		$('#subscribe-box').stop()
						   .animate({width:old+10}, 100)
						   .animate({width:old   }, 100)

		event.preventDefault()
		event.stopPropogation()