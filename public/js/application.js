$(document).ready(function() {
  $("#add_tweet").submit(function(event){
    event.preventDefault();
    $(this).hide()
    $("#content").append("<img src='http://cdnl.complex.com/assets/CHANNEL_IMAGES/MUSIC/2012/08/content/tumblr_lrz5abx6sh1qlqoewo1_500.gif'/> ")
    var data = $(this).serialize();
    $.post("/" ,data ,function(){})
    .done(function(){
      $("#content").html("<h2>WE TAKIN OVA</h2><img src='http://cdnl.complex.com/assets/CHANNEL_IMAGES/MUSIC/2012/08/content/download2_lvajv.gif'/>")
    })

    .fail(function(){
       $("#content").html("<h2>YOU ARE NOT THE BEST. WE DA BEST</h2><img src='http://cdnl.complex.com/assets/CHANNEL_IMAGES/MUSIC/2012/08/content/djkhaled.gif'/>")
    });

  })

});

