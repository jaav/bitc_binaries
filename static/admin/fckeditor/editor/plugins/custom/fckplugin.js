// Ici je cr�e une action FCK qui s'appelle Internlink, et qui chargera le fichier video.html (qui sera au m�me niveau que ce fichier) lors de son appel
FCKCommands.RegisterCommand('Video', new FCKDialogCommand('Video','Video','/bitc/admin/fckEditor/displayVideoForm.do', 400, 300 ));
 
// Ici je cr�e un bouton pour la toolbar auquel j'associe l'action pr�c�demment d�finie
FCKToolbarItems.RegisterItem( 'Video', new FCKToolbarButton( 'Video', 'Video', null, FCK_TOOLBARITEM_ICONTEXT, true, true, 1 ) ) ;

