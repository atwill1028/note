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

  $(".note__input__content__type"). keydown(function(e) {
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        $(this).css("height", $(this).height()+30)
      } else {
          return true;
      }
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
