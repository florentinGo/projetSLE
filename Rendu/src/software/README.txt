————————Description du dossier—————————
Ce dossier contient cinq sous-dossiers.

Le dossier include contient les librairies utilisées : ac_int et mc_scverify.
Le dossier bin contient le fichier exécutable.
Le dossier obj contient les fichiers objets créés à la compilation.
Le dossier src contient les sources que nous avons écrites.
Le dossier scripts contient les scripts exemples que nous avons écrits.
Le dossier image contient 2 images test en format pgm. 
	-> Le choix de cette image se fait dans src/globals.h


———————les scripts à disposition———————
Le script run.sh donne un exemple de transformée en ondelettes et affiche la source, l'image compressée et l'image décompressée.
Le script fullDecomp.sh créé des images totalement décompressées pour différents niveaux de compression.
Le script partialDecomp créé des images comprésées au niveau 5 mais décompressées à des niveaux différents.


———————la commande de compilation————————
make

———————la commande de nettoyage————————
make clean nettoie les images générées et les fichiers objets générés
make cleanimage nettoie uniquement les images .pgm contenues dans le dossier principal

———————la commande d’exécution————————
./bin/exec
	'niveau de compression'
	'niveau de décompression' (0 donne une décompression complète)
	'nom de l'image décompressée'
	'nom de l'image compressée'

