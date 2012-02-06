$(document).ready ->

	$.localScroll(duration: 500)

	$('.modal').fancybox(
		type		: 'ajax'
		minWidth	: 800,
		minHeight	: 600,
		fitToView	: false,
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	)

	$('.subscribe-link').unbind('click')
	$('.subscribe-link').click (event) ->
		$('#subscribe-email').focus()

		old = parseInt( $('#subscribe-box').css('width') )
		$('#subscribe-box').stop()
						   .animate({width:old+10}, 100)
						   .animate({width:old   }, 100)

		event.preventDefault()
		event.stopPropogation()