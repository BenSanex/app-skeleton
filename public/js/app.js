$(function(){
  $('.new_comment_button').on("click", function(){
    $(this).hide();
    var commentForm = $(this).siblings('form');
    commentForm.show();
  });

  $('.new_comment_form').on('submit', function(event){
    event.preventDefault();
    console.log("submitted")

    var comment = $(this).find('.comment_text').val();
    var url = $(this).attr('action')
    var type = $(this).attr('method')
    var form_data = $(this).serialize();
    var print_new_comment = $(this).parent().prev();
    if(comment === ""){
      // $('#comment_text').before('<span class="error">Please either
      //   make a comment, or do not click the button</span>');
        return false
      }
      else{

        $.ajax({
          url: url,
          type: type,
          data: form_data
        })
        .error(function(e) {
          console.error(e)
        })
        .done(function(e) {
          console.log(e)
          console.log("done");
          print_new_comment.prepend('<p>' + comment + '</p>');
          comment = ""
          $('.new_comment_form').hide();
          $('.new_comment_button').show();

    })
  }
})
});
