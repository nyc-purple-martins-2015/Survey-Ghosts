$(document).ready(function() {
  $('#save-all').hide();

  $("#new-survey-form").on("submit", function(event){
    event.preventDefault()
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var data = $(this).serialize();
    var request = $.ajax({
      method: method,
      url: url,
      data: data
    });
    request.done(function(surveyBody){
      $("#question-container").append(surveyBody);
      $('#survey-title-submit').hide();
      $('#save-all').show();
    });
    request.fail(function(response){
      $("#question-container").replaceWith(response.responseText);
    });
  });

  $("#question-containter").on("submit", "#new-question-form", function(event){
    event.preventDefault();
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var data = $(this).serialize();
    var request = $.ajax({
      method: method,
      url: url,
      data: data
    });
    request.done(function(questionBody){
      $('#question-containter').append(questionBody);
    });
    request.fail(function(response){
      $("#question-container").replaceWith(response.responseText);
    });
  });

  // $('#question-containter').on('submit', '#add-question', function(event){
  //   event.preventDefault();
  //   var button = $(this);
  //   var method = $(this).attr('method');
  //   var url = $(this).attr('action');
  //   var request = $.ajax({
  //     type: method,
  //     url: url,
  //   });
  //   request.done(function(response){
  //     button.hide();
  //     $('#question-containter').append(response)
  //   });
  //   request.fail(function(response){
  //     $("#question-container").replaceWith(response.responseText);
  //   });

});
