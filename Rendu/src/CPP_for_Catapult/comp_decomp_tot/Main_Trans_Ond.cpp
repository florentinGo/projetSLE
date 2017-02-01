///////////////////////////////////////////////////////////////////////////////
// Company:        ENSIMAG
// Engineer:       Yu Wanwan, Fondevilla Mathieu
// 
// Module Name:    MAIN program for Catapult C 
// Project Name:   JPEG2000 compression HLS
//
////////////////////////////////////////////////////////////////////////////////
#include "Main_Trans_Ond.h"
#include "ac_int.h"

#pragma design top

/* Fonction qui réalise la transformée en ondelettes d'une image.
 * 	Src : Mémoire contenant l'image source. Sert ensuite au traitement de l'image.
 *	Dst : Mémoire servant au traitement de l'image.
 *	Vga : Mémoire dans laquelle l'image traitée est stockée en fin de traitement.
 *	nbLevels : Le niveau de compression réalisé.
 */

Main_Trans_Ond::Main_Trans_Ond() {}

void Main_Trans_Ond::Mn_Trans_Ond(ac_int<8, false> Src[HEIGHT_IMAGE*WIDTH_IMAGE],
			ac_int<8, false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE],
			ac_int<3, false> nbLevels) {
	
	int i, hi, wi;

	hi = HEIGHT_IMAGE;
	wi = WIDTH_IMAGE;
	
	image_copy(Src, Dst, hi, wi); // Rules the level 0 of compression
	
levels :	for(i=0; i<nbLevels; i++) {

		// We do one level treatment from Src to Dst
		Trans_Ond(Src, Dst, hi, wi);
		
		// Now we only take care of the top-left part of the picture
		hi = hi/2;
		wi = wi/2;
		
		// The next level treatment, if we have to do it, will be written from Dst to Src
		i++;
		if (i != nbLevels) {

			// We do one level treatment from Dst to Src
			Trans_Ond(Dst, Src, hi, wi);

			// We copy back the pictures created into the Dst memory
			image_copy(Src, Dst, hi, wi);

			hi = hi/2;
			wi = wi/2;
		}
	}

}

/* Effectue un niveau de transformée en ondelettes
 *	- Src : Mémoire contenant l'image à traiter
 *	- Dst : Mémoire où stcoker l'image traitée
 *	- hi  : Hauteur de l'image à traiter
 *	- wi  : Largeur de l'image à traiter
 */
void Main_Trans_Ond::Trans_Ond(ac_int<8, false> Src[HEIGHT_IMAGE*WIDTH_IMAGE], ac_int<8, false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE], int hi, int wi) {

		ac_int<9,false> x;
		ac_int<8,false> y;
		ac_int<17,false> as1, as2, as3, as4;
		ac_int<17,false> ad1, ad2, ad3, ad4;
	
passe_x : for (y = 0; y < (hi)/2; y++) {
passe_y : for (x = 0; x < (wi)/2; x++) {
    
    			// @ des pixels source à traiter pour cette itération
			as1 = (WIDTH_IMAGE*(2*y))   + 2*x; 	// 2x  , 2y
			as2 = (WIDTH_IMAGE*(2*y))   + 2*x+1; 	// 2x+1, 2y
			as3 = (WIDTH_IMAGE*(2*y+1)) + 2*x;	// 2x  , 2y+1
			as4 = (WIDTH_IMAGE*(2*y+1)) + 2*x+1;	// 2x+1, 2y+1 

			// @ pixels destination
			ad1 = (WIDTH_IMAGE*y)        + x;	// LxLy
			ad2 = (WIDTH_IMAGE*y)	+ x+wi/2;	// LxHy
			ad3 = (WIDTH_IMAGE*(y+hi/2)) + x;	// HxLy
			ad4 = (WIDTH_IMAGE*(y+hi/2)) + x+wi/2;	// HxHy

			// Calcul des pixels destination
			Dst[ad1] = moy(moy(Src[as1], Src[as2]), moy(Src[as3],Src[as4]));
			Dst[ad2] = sub(moy(Src[as1], Src[as2]), moy(Src[as3],Src[as4]));
			Dst[ad3] = moy(sub(Src[as1], Src[as2]), sub(Src[as3],Src[as4]));
			Dst[ad4] = sub(sub(Src[as1], Src[as2]), sub(Src[as3],Src[as4]));
		   }
		   }

}

/* Retourne la moyenne de v1 et v2
 */
ac_int<8, false> Main_Trans_Ond::moy(ac_int<8, false> v1, ac_int<8, false> v2) {
	
	return (v1+v2)/2;
}

/* Retourne la valeur absolue de différence entre v1 et v2
 */
ac_int<8, false> Main_Trans_Ond::sub(ac_int<8, false> v1, ac_int<8, false> v2) {
	/*if(v1 > v2){
	  return  v1 - v2;
	}
  else{
	  return v2 - v1;
	} pour une "bonne" transposé mais non recomposable avec leur code*/
	return (v1 - v2)/2; // pour une transposée recomposable mais de mauvaise qualité
}

/* Copie d'une image
 *	Src : Mémoire où est stockée l'image source
 *	Dst : Mémoire où stocker l'image à copier
 *	hi  : Hauteur de l'image à copier
 *	wi  : Largeur de l'image à copier
 */
void Main_Trans_Ond::image_copy(ac_int<8, false> Src[HEIGHT_IMAGE*WIDTH_IMAGE],
								ac_int<8, false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE],
								int hi, int wi) {

	int x, y;

copy_x : for (y = 0; y < (hi); y++) {
copy_y : for (x = 0; x < (wi); x++) {
		Dst[WIDTH_IMAGE*y + x] = Src[WIDTH_IMAGE*y + x];
	}
	}
}











