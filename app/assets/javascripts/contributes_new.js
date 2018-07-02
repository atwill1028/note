$(function(){
  $(".public__setting").click(function(){
    if($("#contribute_title").val() == ""){
        alert("タイトルを入力してください。")
    }else{
        modal__toggle();
    }
  });

  $("#price_visit_notfree, #price_visit_free").click(function(){
      if($("#price_visit_notfree").is(":checked")){
          $(".price__decide").css("display", "block");
          $("#contribute_price").val(100);
      }else{
          $(".price__decide").css("display", "none");
          $("#contribute_price").val(0);
          modal__make__able();
      }
  });

  $("#contribute_price").change(function(){
    if(($("#contribute_price").val() == "") || ($("#contribute_price").val() < 100) || ($("#contribute_price").val() > 10000)){
        $(".modal__submit").css("pointer-events", "none");
        $(".modal__submit").css("color", "#bdc3c7");
        $(".modal__submit").css("background-color", "#f8f9fa");
        $(".price__alert").css("display", "block");
    }else{
      modal__make__able();
    }
  });

  $(".modal__cancel__button").click(function(){
    modal__toggle();
  });

  $(".setting__tag__and__magazine").click(function(){
    $(".setting__tag__and__magazine__open").toggle();
  })

  $(".note__input__title__type").keydown(function(e) {
    if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
      e.preventDefault();
      $(".note__input__content__type").focus();
    } else {
      return true;
    }
  });

  $(".note__input__content__type").keydown(function(e) {
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        $(this).css("height", $(this).height()+30)
      } else {
        return true;
      }
  });

  $("#contribute_tag_make").keydown(function(e) {
    var contribute_tag_val = $("#contribute_tag_make").val();
    var taboo_sharp = "#";
    var taboo_x = "×";
    var normal_color = "black";
    var alert_color = "red";
    var repeated_character_flag = 0;
    $("#contribute_tag_make").css("color", normal_color);
    if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
      e.preventDefault();
      $(".one_tag").each(function(i,val){
        var one_tag = $(val).text().slice(1).slice(0,-1);
        if (contribute_tag_val == one_tag) {
          $("#contribute_tag_make").css("color", alert_color);
          repeated_character_flag = 1;
        }
      })
      if (contribute_tag_val.match(taboo_sharp)||contribute_tag_val.match(taboo_x)) {
        $("#contribute_tag_make").css("color", alert_color);
      }else if (contribute_tag_val != "" && repeated_character_flag == 0) {
        $(".tag_list").append('<li class= "one_tag inline">'+"#"+contribute_tag_val+'<a class= "cancel_tag ">'+"×"+'</a>'+'</li>');
        $("#contribute_tag_make").val("");
      }
    }
    if (contribute_tag_val == "") {
      if ((e.which && e.which === 8) || (e.keyCode && e.keyCode === 8)) {
        $(".one_tag").filter(":last").remove();
      }
    }
  });

  $(document).on("click",".cancel_tag", function(){
    $(this).parent(".one_tag").remove();
  });

  $(".modal__submit").on('click', function(e){
    var tags = []
    $(".one_tag").each(function(i,val){
      var one_tag = $(val).text().slice(1).slice(0,-1);
      tags.push(one_tag);
    })
    $("#contribute_tag_name").val(tags);
  });

  function modal__make__able(){
    $(".modal__submit").css("pointer-events", "auto");
    $(".modal__submit").css("color", "#fff")
    $(".modal__submit").css("background-color", "#2cb696");
    $(".price__alert").css("display", "none");
  }

  function modal__toggle(){
    $("#modal__overlay").toggle();
    $(".modal__box").toggle();
  }
});
