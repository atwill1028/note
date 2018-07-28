$(function(){
  var url = location.href ;
  var comment_position = $(document).height();
  var scroll_speed = 100
  if(url.match("scroll=comment")){
    $("html,body").animate({ scrollTop: comment_position }, scroll_speed);
  }

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

  $(document).on("click", ".fa-ellipsis-h", function (e) {
    var target_balloon = "balloon" + $(this).attr('id').replace("ellipshis","");
    $("#" + target_balloon).toggle();
  })

  $(document).on({
    'mouseenter' : function(){
      $(this).css("background-color", "#F2F2F2");
    },
    'mouseleave' : function(){
      $(this).css("background-color", "white");
    }
  },
    ".comment__edit, .comment__delete, .comment__report"
  );

  $(document).on("click", ".toggle__key", function (e) {
    $(".comment__overlay").toggle();
    $(".comment__box").toggle();
  });

  $(document).on("click", ".comment__delete", function (e) {
    var comment_id = $(this).parents(".balloon").attr('id').replace("balloon","");
    var delete_link =  `<a href = /comments/${comment_id} data-method = 'delete' class = 'delete_link toggle__key' data-remote="true">削除する</a>`;
    $(".comment__delete__button").html(delete_link);
  });

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
