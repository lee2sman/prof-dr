$(document).ready(function(){

  $("li").mouseover(function(){
    $(this).css('rotate',Math.random()*360+"deg");
  });

  $("#students").fadeIn(5000);

});
