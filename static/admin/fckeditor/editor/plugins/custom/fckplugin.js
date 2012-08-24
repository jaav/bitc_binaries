// Ici je crée une action FCK qui s'appelle Internlink, et qui chargera le fichier video.html (qui sera au même niveau que ce fichier) lors de son appel
FCKCommands.RegisterCommand('Video', new FCKDialogCommand('Video','Video','/bitc/admin/fckEditor/displayVideoForm.do', 400, 300 ));
 
// Ici je crée un bouton pour la toolbar auquel j'associe l'action précédemment définie
FCKToolbarItems.RegisterItem( 'Video', new FCKToolbarButton( 'Video', 'Video', null, FCK_TOOLBARITEM_ICONTEXT, true, true, 1 ) ) ;

