function register_click_handler(button_id, css_class_name) {
  $(button_id).on("mousedown", function(){
    text = "<span class='" + css_class_name + "'>" + window.getSelection().toString() + "</span>";
    document.execCommand("inserthtml", false, text);
  })
}
$(function() {
  $("#uebersetzung_editable").on("input", function(){
    $("#entry_uebersetzung").attr("value", $("#uebersetzung_editable").html())
  });
  
  $("#b2").on("mousedown", function(){
    text = "<span class='werktitel_original'>" + window.getSelection().toString() + "</span>";
    document.execCommand("inserthtml", false, text);
  })
  register_click_handler("#b1", "fachtermini");
  register_click_handler("#b2", "werktitel_original");
});


