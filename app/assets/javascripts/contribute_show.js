$(function(){
  $(".target_tag").hover(
    function () {
      $(this).css("background-color", "silver");
    },
    function () {
      $(this).css("background-color", "#EAECEC");
    }
  );

  $(document).on('click',function(e) {
     if(!$(e.target).closest('#comment_content').length) {
      $("#comment_content").css("border", "none");
     } else {
      $("#comment_content").css("border", "1px solid #2CB696");
      $("#comment_content").css("border-radius", "5px");
     }
  });

  $("#comment_content").focusin(function(e) {
      var content = $(this).val();
      comment_opacity(content, 0.5);
    })
    .focusout(function(e) {
      var content = $(this).val();
      comment_opacity(content, 0);
  });

  $('#comment_content').attr('autocomplete', 'off');

  $("#comment_content").keyup(function(e) {
    var content = $(this).val();
    comment_opacity(content, 0.5);
  });
  $("#comment_content").keydown(function(e){
    if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
      e.preventDefault();
    }
  })

  function comment_opacity(content,target_opacity){
    if (content != "") {
     $("#comment_submit").css('opacity', 1);
     $("#comment_submit").css('pointer-events', 'auto');
     $("#comment_submit").css("cursor", "pointer");
    }else {
     $("#comment_submit").css('opacity', target_opacity);
     $("#comment_submit").css('pointer-events', 'none')
    }
  }
});
