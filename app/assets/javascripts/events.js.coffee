$(document).ready ->
	element = $("#google-map")[0]
	options = {
		center: new google.maps.LatLng(40.441501,-79.94299),
		zoom: 18,
		disableDefaultUI: true,
		mapTypeId: google.maps.MapTypeId.HYBRID
	}
	map = new google.maps.Map(element, options)