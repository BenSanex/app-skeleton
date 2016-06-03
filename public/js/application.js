
$(document).ready(function() {

  $(".vote-form").on("submit", function(event) {
    event.preventDefault();

    var form = $(this);
    var url = form.attr("action");
    var method = form.attr("method");
    var data = form.serialize();

    var request = $.ajax({url: url, method: method, data: data});

    request.done(function(votable) {
      form.closest("div").find(".points").html(votable.points);
      if (votable.login) { form.find("button").toggleClass("orange");
        form.siblings("form").find('button').removeClass("orange");
      }
    });
  });
});
