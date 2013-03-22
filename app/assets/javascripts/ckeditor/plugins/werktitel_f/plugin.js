CKEDITOR.plugins.add( 'werktitel_f',
{
  init: function( editor ){
    editor.addCommand( 'markWerktitel_f',
      {
        exec : function( editor )
        {
          var selection = editor.getSelection();
          var start_el = selection.getStartElement();
          if (start_el.hasClass("werktitel_fremdspr")){
            if (start_el.getText() == selection.getSelectedText()){
              start_el.removeClass("werktitel_fremdspr")
            } else {
              editor.insertHtml("<span>" + selection.getSelectedText() + "</span>");
            }
          } else {
            if (start_el.getText() == selection.getSelectedText() && start_el.$.tagName == "SPAN"){
              start_el.addClass("werktitel_fremdspr")
            } else {
          editor.insertHtml( "<span class='werktitel_fremdspr'>" + selection.getSelectedText() + "</span>" );
            }
          }

        }
      });
    editor.ui.addButton( 'Werktitel fremdspr',
      {
        label: 'Werktitel fremdspr',
        command: 'markWerktitel_f',
        //icon: this.path + 'images/werktitel_f.png'
      } );
  }

} );
