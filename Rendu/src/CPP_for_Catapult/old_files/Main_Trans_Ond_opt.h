////////////////////////////////////////////////////////////////////////////////
// Company:        ENSIMAG
// Engineer:       Fondevilla Mathieu, Yu Wanwan
// 
// Module Name:    MAIN header for Catapult C 
// Project Name:   JPEG2000 & HLS
//
////////////////////////////////////////////////////////////////////////////////
#ifndef MAIN_TRANS_OND_OPT_H
#define MAIN_TRANS_OND_OPT_H

// Size of the original picture
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240

#include "ac_int.h"

/* Fonction qui réalise la transformée en ondelettes d'une image.
 * 	Src : Mémoire contenant l'image source. Sert ensuite au traitement de l'image.
 *	Dst : Mémoire servant au traitement de l'image.
 *	Vga : Mémoire dans laquelle l'image traitée est stockée en fin de traitement.
 *	nbLevels : Le niveau de compression réalisé.
 */
void Main_Trans_Ond (ac_int<8,false> Data[HEIGHT_IMAGE*WIDTH_IMAGE],
            	     ac_int<8,false> Comp[HEIGHT_IMAGE*WIDTH_IMAGE],
            	     ac_int<8,false> Vga[HEIGHT_IMAGE*WIDTH_IMAGE],
	    	     ac_int<3,false>nbLevels);


/* Effectue un niveau de transformée en ondelettes
 *	- Src : Mémoire contenant l'image à traiter
 *	- Dst : Mémoire où stcoker l'image traitée
 *	- hi  : Hauteur de l'image à traiter
 *	- wi  : Largeur de l'image à traiter
 */
void Trans_Ond (ac_int<8,false> Data[HEIGHT_IMAGE*WIDTH_IMAGE],
		ac_int<8,false> Comp[HEIGHT_IMAGE*WIDTH_IMAGE],
		int height_image, int width_image);


/* Retourne la moyenne de v1 et v2
 */
ac_int<8,false> moy(ac_int<8,false> v1, ac_int<8,false> v2);  


/* Retourne la valeur absolue de différence entre v1 et v2
 */
ac_int<8,false> sub(ac_int<8,false> v1, ac_int<8,false> v2);  


/* Copie d'une image
 *	Src : Mémoire où est stockée l'image source
 *	Dst : Mémoire où stocker l'image à copier
 *	hi  : Hauteur de l'image à copier
 *	wi  : Largeur de l'image à copier
 */
void image_copy(ac_int<8,false> Src[HEIGHT_IMAGE*WIDTH_IMAGE],
		ac_int<8,false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE],
		int height_image, int width_image);

#endif
