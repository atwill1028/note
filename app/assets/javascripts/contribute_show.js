$(function(){
  $(".target_tag").hover(
    function () {
      $(this).css("background-color", "silver");
    },
    function () {
      $(this).css("background-color", "#EAECEC");
    }
  );
});
