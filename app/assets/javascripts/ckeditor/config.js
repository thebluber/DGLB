CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'MyToolbar';
  config.extraPlugins = 'fachtermini,werktitel_o,werktitel_f';

  config.toolbar_MyToolbar =
    [
      ['Fachtermini', 'Werktitel original', 'Werktitel fremdspr']
    ];
};
