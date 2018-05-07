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
});

