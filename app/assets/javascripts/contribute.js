$(function(){
  $(".search__button").click(function(){
    $(this).replaceWith('<input class="search__window"></input>');
    $(".search__window").css("border-radius", "100px");
    $(".search__window").attr("placeholder", "キーワードや作者名で検索");
    $(".search__window").css("font-size", "11px");
    $(".search__window").css("width", "200px");
    $(".search__window").css("background-color", "#f7f9f9");
    $(".search__window").css("height", "32px");
    $(".search__window").css("padding", "5px 30px 5px 10px");
    $(".search__window").css("box-sizing", "border-box");
    $(".search__window").css("outline", "none");
  });

  $(".notification__button").click(function(){
    if ($(this).hasClass("active")) {
    $(this).removeClass("active");
    $(this).attr("src", "https://d2l930y2yx77uc.cloudfront.net/assets/renewal/icon_30_notification-8d3ad008212d7ab5372a8c6efae717fd0f273e6f19ac92781c8eb2a0b14850d8.svg");
    }else {
    $(this).addClass("active");
    $(this).attr("src", "https://d2l930y2yx77uc.cloudfront.net/assets/renewal/icon_30_notification_active-20424e1cb5904745befbc11c929bdb15afc4ff7847343413186646be464fa1c8.svg");
    }
  });

  $(".new__post__create").click(function(){
    $(".new__post__select").toggle();
  })

  $("#hashtags, #hashtag").hover(
  function () {
    $(".header__category ul:first").addClass("hide");
    $(".header__category ul:nth-child(2)").removeClass("hide")
  },
  function () {
    $(".header__category ul:first").removeClass("hide");
    $(".header__category ul:nth-child(2)").addClass("hide")
  }
);
});
