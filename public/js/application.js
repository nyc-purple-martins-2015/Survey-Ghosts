$(document).ready(function() {
  $('#save-all').hide();

  $("#new-survey-form").on("submit", function(event){
    event.preventDefault()
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var data = $(this).serialize();
    var request = $.ajax({
      data: data,
      method: method,
      url: url
    });
    request.done(function(surveyBody){
      $("#question-container").append(surveyBody);
      $('#survey-title-submit').hide();
      $('#save-all').show();
    });
    request.fail(function(response){
      $("#question-container").replaceWith(response.responseText);
    });
  })



});
