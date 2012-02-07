$(document).ready ->

	$.localScroll(duration: 500)

	$('.modal').fancybox(
		type		: 'iframe'
		minWidth	: 800,
		minHeight	: 600,
		padding		: 0,
		fitToView	: false,
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	)

	$('.subscribe-link').unbind('click')
	SUBSCRIBE_LINK_WIDTH = parseInt( $('#subscribe-box').css('width') )
	$('.subscribe-link').click (event) ->
		$('#subscribe-email').focus()

		$('#subscribe-box').stop()
						   .animate({width:SUBSCRIBE_LINK_WIDTH+30}, 100)
						   .animate({width:SUBSCRIBE_LINK_WIDTH   }, 100)

		event.preventDefault()
		event.stopPropogation()