$(document).ready(function(){

  // AJAX request for comments in dashboard
  $("#join-team").submit(function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.ajax({
      url: url,
      type: "POST",
      data, data,
      dataType: "script"
    });
  });


});
