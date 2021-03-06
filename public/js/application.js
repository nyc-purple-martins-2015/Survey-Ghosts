$(document).ready(function() {

  $(".start_survey_link").on('click', function(event) {
    event.preventDefault();

    var url = $(this).attr("href");
    var link = $(this);

    var showFirstQuestion = $.ajax({
      method: "get",
      url: url
      }).done(function(firstPage) {
        link.replaceWith(firstPage);
        $('.question_page form').on('submit', function(event) {
          event.preventDefault();

          var next_link = $(this);

          var showSecondQuestion= $.ajax({
            method: "post",
            url: "/chosen_options",
            data: next_link.serialize()
            }).done(function(newPage) {
              $('.question_page').replaceWith(newPage);
              });

      });

  });

});

});

 // $("#new-horse").on('click', function(event) {
 //    event.preventDefault();
 //    loadNewHorseForm();
 //  });

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

  $(document).on('click', '.authored-surveys', function(event){
    event.preventDefault();
    var survey_and_author_id = this.id.split(" ");
    var survey_id = survey_and_author_id[0];
    var author_id = survey_and_author_id[1];
    var individual_survey = $.ajax({
      method: "get",
      url: "/users/" + author_id + "/surveys/" + survey_id
    })

    individual_survey.done(function(data){
      $('#'+ survey_id + '\\ ' + author_id).append(data)
    })
  })
});
