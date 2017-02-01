Ce dossier contient les fichiers sources vhdl nécessaires à la synthèse du programme de démonstration.


----- Fichiers sources vhdl --------
camera_capture.vhd
clk_pll.vhd
multiplexer_RGB.vhd
packageVGA.vhd
system_top.ucf
system_top.vhd
VGA_generator.vhd

CatapultC
	Contient les fichiers EDIF générés par CatapultC à intégrer au projet.
	Le fichier à intégrer doit être nommé "Main_Trans_Ond_Opt.edf".
	Contient également le fichier rtl.vhdl décrivant l'interface.
coregen
	Contient les fichiers .ngc et .vhdl de la mémoire utilisée. (240*320 mots de 8 bits)
