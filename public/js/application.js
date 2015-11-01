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
