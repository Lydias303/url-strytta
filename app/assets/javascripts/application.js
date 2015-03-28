$(function(){
$('a[title]').tooltip();
});

$("#text_box").keyup(function() {
  $("li").hide();
  var term = $(this).val();
  $("li:contains('"+ term +"')").show();
});
