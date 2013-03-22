CKEDITOR.plugins.add( 'fachtermini',
{
  init: function( editor ){
    editor.addCommand( 'markFachtermini',
      {
        exec : function( editor )
        {
          var selection = editor.getSelection();
          var start_el = selection.getStartElement();
          if (start_el.hasClass("fachtermini")){
            if (start_el.getText() == selection.getSelectedText()){
              start_el.removeClass("fachtermini")
            } else {
              editor.insertHtml("<span>" + selection.getSelectedText() + "</span>");
            }
          } else {
            if (start_el.getText() == selection.getSelectedText() && start_el.$.tagName == "SPAN"){
              start_el.addClass("fachtermini")
            } else {
              editor.insertHtml( "<span class='fachtermini'>" + selection.getSelectedText() + "</span>" );
            }
          }

        }
      });
    editor.ui.addButton( 'Fachtermini',
      {
        label: 'Fachtermini',
        command: 'markFachtermini',
        //icon: this.path + 'images/fachtermini.png'
      } );
  }

} );
