// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require 'jquery-2.1.1'
//= require jquery_ujs
//= require 'bootstrap'
//= require 'thinkfitme_specific'
//= require 'cocoon'
//= require turbolinks

$(document).ready(function() {

	// AJAX request for comments in dashboard
	$("#new_comment").submit(function(event){
		event.preventDefault();

		var url = $(this).attr('action');
		var data = $(this).serialize();

		$.ajax({
			url: url,
			type: "POST",
			data: data,
			dataType: "script"
		});
	});

	// getScript request for user searches
	$('#search-user').submit(function(event){
		event.preventDefault();

		var searchValue = $('#search').val();

		$.getScript('/users?search=' + searchValue);

	});

	// getScript request for team searches
	$('#search-team').submit(function(event){
		event.preventDefault();

		var searchValue = $('#search').val();

		$.getScript('/teams?search=' + searchValue);
	});

});