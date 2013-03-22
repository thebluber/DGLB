CKEDITOR.plugins.add( 'werktitel_o',
{
  init: function( editor ){
    editor.addCommand( 'markWerktitel_o',
      {
        exec : function( editor )
        {
          var selection = editor.getSelection();
          var start_el = selection.getStartElement();
          if (start_el.hasClass("werktitel_original")){
            if (start_el.getText() == selection.getSelectedText()){
              start_el.removeClass("werktitel_original")
            } else {
              editor.insertHtml("<span>" + selection.getSelectedText() + "</span>");
            }
          } else {
            if (start_el.getText() == selection.getSelectedText() && start_el.$.tagName == "SPAN"){
              start_el.addClass("werktitel_original")
            } else {
          editor.insertHtml( "<span class='werktitel_original'>" + selection.getSelectedText() + "</span>" );
            }
          }

        }
      });
    editor.ui.addButton( 'Werktitel original',
      {
        label: 'Werktitel original',
        command: 'markWerktitel_o',
        //icon: this.path + 'images/werktitel_o.png'
      } );
  }

} );
