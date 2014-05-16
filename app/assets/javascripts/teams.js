$(document).ready(function(){

	// AJAX request for comments in dashboard
	$("#join-team").submit(function(event){
		event.preventDefault();

		var url = $(this).attr('action');

		$.ajax({
			url: url,
			type: "POST",
			dataType: "script"
		});
	});


});
