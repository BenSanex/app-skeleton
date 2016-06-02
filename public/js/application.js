
// $(document).ready(function() {

//   $(".vote-form").on("submit", function(event) {
//     event.preventDefault();

//     var form = $(this);
//     var url = form.attr("action");
//     var method = form.attr("method");
//     var data = form.serialize();

//     var request = $.ajax({url: url, method: method, data: data});

//     request.done(function(post) {
//       form.closest("article").find(".points").html(post.points);
//       // form.find(".upvote-button").css({color: "red"});
//     });
//   });
// });
