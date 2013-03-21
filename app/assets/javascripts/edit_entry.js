$(function() {
  $("#uebersetzung_editable").on("input", function(){
    $("#entry_uebersetzung").attr("value", $("#uebersetzung_editable").html())
  });
});
