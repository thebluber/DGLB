CKEDITOR.plugins.add( 'fachtermini',
{
  init: function( editor ){
    var style = new CKEDITOR.style({element: 'span', attributes: {'class': 'fachtermini'}});
    // Listen to contextual style activation.
    editor.attachStyleStateChange( style, function( state ) {
      !editor.readOnly && editor.getCommand( 'markFachtermini' ).setState( state );
    });
    editor.addCommand( 'markFachtermini', new CKEDITOR.styleCommand( style ));
    editor.ui.addButton( 'Fachtermini',
      {
        label: 'Fachtermini',
        command: 'markFachtermini',
        //icon: this.path + 'images/fachtermini.png'
      } );
  }

} );
