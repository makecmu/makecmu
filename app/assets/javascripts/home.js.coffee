$(document).ready ->

	$('.subscribe-link').click (event) ->
		$('#subscribe-email').focus()

		old = parseInt( $('#subscribe-box').css('width') )
		$('#subscribe-box').stop()
						   .animate({width:old+10}, 100)
						   .animate({width:old   }, 100)

		event.preventDefault()
		false