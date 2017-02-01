///////////////////////////////////////////////////////////////////////////////
// Company:        ENSIMAG
// Engineer:       Yu Wanwan, Fondevilla Mathieu
// 
// Create Date:    20:15:32 05/12/2015 
// Design Name: 
// Module Name:    MAIN program for Catapult C 
// Project Name:   JPEG2000 compression HLS
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////
#include "Main_Trans_Ond.h"
#include "ac_int.h"

#include <iostream>
using namespace std;

/* Fonction qui réalise la transformée en ondelettes de l'image écrite dans la mémoire Src.
   Le niveau de compression réalisé est égal à nbLevels.
   L'image finale est écrite dans la mémoire Dst.
*/
void Main_Trans_Ond(ac_int<8, false> Src[256*512], ac_int<8, false> Dst[256*512], int nbLevels) {
	
	int i, hi, wi;

	hi = HEIGHT_IMAGE;
	wi = WIDTH_IMAGE;

	for(i=0; i<nbLevels; i++) {

#ifdef DEBUG
		cout << "Dst to Src / hi : " << hi << endl;
#endif

		// On réalise un niveau de compression
		Trans_Ond(Src, Dst, hi, wi);

		// Si on ne peut pas compresser plus, il est inutile de continuer à traiter
		if (hi==0 || wi==0) break;
		
		// Le prochain niveau de compression ne s'intéressera qu'à une image plus petite
		hi = hi/2;
		wi = wi/2;

		// On recopie l'image dans la mémoire source
		image_copy(Dst, Src, HEIGHT_IMAGE, WIDTH_IMAGE);
#ifdef DEBUG
		cout << "Dst to Src / hi : " << hi << endl;
#endif
	}
}

/* Fonction qui réalise un niveau de la transformée en ondelettes de l'image écrite dans la mémoire Src.
   La taille de l'image à traiter est défninie par hi(hauteur) et wi(largeur)
   L'image finale est écrite dans la mémoire Dst.
*/
void Trans_Ond(ac_int<8, false> Src[256*512], ac_int<8, false> Dst[256*512], int hi, int wi) {

		ac_int<9,false> x;
		ac_int<8,false> y;
		ac_int<17,false> as1, as2, as3, as4;
		ac_int<17,false> ad1, ad2, ad3, ad4;
	
hsplit_x : for (y = 0; y < (hi)/2; y++) {
hsplit_y : for (x = 0; x < (wi)/2; x++) {
    
    			   // @ des pixels source à traiter pour cette itération
				   as1 = (512*(2*y))   + 2*x; 		// 2x  , 2y
				   as2 = (512*(2*y))   + 2*x+1; 	// 2x+1, 2y
				   as3 = (512*(2*y+1)) + 2*x;		// 2x  , 2y+1
				   as4 = (512*(2*y+1)) + 2*x+1;		// 2x+1, 2y+1 

				   // @ pixels destination
				   ad1 = (512*y)        + x;		// LxLy
				   ad2 = (512*y) 		+ x+wi/2;	// LxHy
				   ad3 = (512*(y+hi/2)) + x;		// HxLy
				   ad4 = (512*(y+hi/2)) + x+wi/2;	// HxHy

                   // Calcul des pixels destination
				   Dst[ad1] = moy(moy(Src[as1], Src[as2]), moy(Src[as3],Src[as4]));
				   Dst[ad2] = sub(moy(Src[as1], Src[as2]), moy(Src[as3],Src[as4]));
				   Dst[ad3] = moy(sub(Src[as1], Src[as2]), sub(Src[as3],Src[as4]));
				   Dst[ad4] = sub(sub(Src[as1], Src[as2]), sub(Src[as3],Src[as4]));
		   }
		   }

}


ac_int<8,false> moy(ac_int<8,false> v1, ac_int<8,false> v2) {
	
	return (v1+v2)/2;
}


ac_int<8,false> sub(ac_int<8,false> v1, ac_int<8,false> v2) {

	return (v1-v2)/2;
}

/* Recopie l'image Src dans Dst
 */
void image_copy(ac_int<8,false> Src[256*512], ac_int<8,false> Dst[256*512], int hi, int wi) {

	int x, y;

copy_x : for (y = 0; y < (hi); y++) {
copy_y : for (x = 0; x < (wi); x++) {
		Dst[512*y + x] = Src[512*y + x];
	}
	}
}











