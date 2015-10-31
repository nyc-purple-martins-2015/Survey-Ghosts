$(document).ready(function() {

  $("a.start_survey_link").on('click', function(event) {
    event.preventDefault();

    var url = $(this).attr("href");
    var link = $(this)

    var showFirstQuestion = $.ajax({
      method: "get",
      url: url
    }).done(function(firstPage) {
      link.replaceWith(firstPage);
    })

  });

});

 // $("#new-horse").on('click', function(event) {
 //    event.preventDefault();
 //    loadNewHorseForm();
 //  });
