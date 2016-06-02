lines (23 sloc)  969 Bytes
$(document).ready(function() {

  // bind a sumbit handler to each upvote form
  $(".vote-form").on("submit", function(event) {
    event.preventDefault();

    var form = $(this);

    // get the action and method attributes from the form
    var url = form.attr("action");
    var method = form.attr("method");

    // get any data that the user filled out on the form
    var data = form.serialize();

    // send the HTTP request to the server
    var request = $.ajax({url: url, method: method, data: data});

    // tell the request how to handle the response when it comes back
    request.done(function(post) {
      // update the points based on the data the server sent back
      form.closest("article").find(".points").html(post.points);

      // make the upvote button red
      form.find(".upvote-button").css({color: "red"});

      // remove the focus (annoying blue glow) from the button that was clicked
      $(":focus").blur();
    });
  });
});