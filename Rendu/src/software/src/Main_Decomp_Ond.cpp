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
#include "Main_Decomp_Ond.h"
#include "Main_Trans_Ond.h"
#include "ac_int.h"
#include <math.h>

#include <iostream>
using namespace std;

/* Fonction qui réalise la décompression de l'image transformée en ondelettes écrite dans la mémoire Src.
   Le niveau de compression subi par l'image réalisé est renseigné par nbLevels.
   Le niveau de décompression souhaité est renseigné par quality.
   L'image finale est écrite dans la mémoire Dst.
*/
void Main_Decomp_Ond(ac_int<8, false> Src[256*512], ac_int<8, false> Dst[256*512], int nbLevels, int quality) {
	
	int i, hi, wi, himpairs, wimpairs;

	himpairs = 0;
	wimpairs = 0;
	hi = HEIGHT_IMAGE;
	wi = WIDTH_IMAGE;

	for (i=0; i<nbLevels; i++) {
        if (hi>1 && wi>1) {
			if (hi & 0x1) himpairs++;
			hi = hi/2;

			if (wi & 0x1) wimpairs++;
			wi = wi/2;
			}
		else nbLevels = i;
	}

    for(i=0; i<(nbLevels - quality); i++) {

		hi = hi*2;
		wi = wi*2;

		if (himpairs > 0) hi++;
		if (wimpairs > 0) wi++;

		himpairs--;
		wimpairs--;

#ifdef DEBUG
		cout << "Src to Dst " << i << " / hi : " << hi << endl;
#endif

		Decomp_Ond(Src, Dst, hi, wi);		
		i++;

		if (i != (nbLevels - quality)) {
			
			hi = hi*2;
			wi = wi*2;

			if (himpairs > 0) hi++;
			if (wimpairs > 0) wi++;

			himpairs--;
			wimpairs--;

#ifdef DEBUG
			cout << "Dst to Src " << i << " / hi : " << hi << endl; //DEBUG
#endif

			Decomp_Ond(Dst, Src, hi, wi);	
			image_copy(Src, Dst, hi, wi);
		}
	}
    for (i=quality;i>=1; i--) {
        if ((nbLevels - i) & 0x1) {
            image_agrandir(Dst, Src, hi, wi);
            hi = hi*2;
            wi = wi*2;
            image_copy(Src, Dst, hi, wi);
        }else{
            image_agrandir(Src, Dst, hi, wi);
            hi = hi*2;
            wi = wi*2;
            image_copy(Dst, Src, hi, wi);
        }
    }
}


/* Fonction qui réalise un niveau de la décompression.
   La taille de l'image à traiter est défninie par hi(hauteur) et wi(largeur)
   L'image finale est écrite dans la mémoire Dst.
*/
void Decomp_Ond(ac_int<8, false> Src[256*512], ac_int<8, false> Dst[256*512], int hi, int wi) {

		ac_int<9,false> x;
		ac_int<8,false> y;
		ac_int<17,false> as1, as2, as3, as4;
		ac_int<17,false> ad1, ad2, ad3, ad4;
	
hsplit_x : for (y = 0; y < (hi)/2; y++) {
hsplit_y : for (x = 0; x < (wi)/2; x++) {

                   // @ pixels source
				   as1 = (512*y)        + x;		// LxLy
				   as2 = (512*y) 		+ x+wi/2;	// LxHy
				   as3 = (512*(y+hi/2)) + x;		// HxLy
				   as4 = (512*(y+hi/2)) + x+wi/2;	// HxHy

    			   // @ des pixels destination à traiter pour cette itération
				   ad1 = (512*(2*y))   + 2*x; 		// 2x  , 2y
				   ad2 = (512*(2*y))   + 2*x+1; 	// 2x+1, 2y
				   ad3 = (512*(2*y+1)) + 2*x;		// 2x  , 2y+1
				   ad4 = (512*(2*y+1)) + 2*x+1;		// 2x+1, 2y+1
				   
                   // Calcul des pixels destination
				   Dst[ad1] = Src[as1] + Src[as2] + (Src[as3] + Src[as4]);
				   Dst[ad2] = Src[as1] + Src[as2] - (Src[as3] + Src[as4]);
				   Dst[ad3] = Src[as1] - Src[as2] + (Src[as3] - Src[as4]);
				   Dst[ad4] = Src[as1] - Src[as2] - (Src[as3] - Src[as4]);

#ifdef DEBUG
				if (x==34 && y==0)  cout << " " << Src[as1] << " " << Src[as2] << " " << Src[as3] << " " << Src[as4] << endl;//DEBUG
				if (x==34 && y==0)  cout << " " << Dst[ad1] << " " << Dst[ad2] << " " << Dst[ad3] << " " << Dst[ad4] << endl;//DEBUG
				if (x==34 && y==0)  cout << moy(moy(Src[as1], Src[as2]), moy(Src[as3],Src[as4])) << " " << (98-97)/2 << endl;
#endif
		   }
		   }


}

/* Fonction agrandissant l'image Src en doublant sa hauteur (hi) et sa largeur (wi)
 */
void image_agrandir(ac_int<8,false> Src[256*512], ac_int<8,false> Dst[256*512], int hi, int wi) {
    
    int x, y;
    
    agrandir_x : for (y = 0; y < hi; y++) {
        agrandir_y : for (x = 0; x < wi; x++) {
            Dst[512*2*y + 2*x] = Src[512*y + x];    // 2x  , 2y
            Dst[512*2*y + (2*x+1)] = Src[512*y + x];    // 2x+1  , 2y
            Dst[512*(2*y+1) + 2*x] = Src[512*y + x];    // 2x  , 2y+1
            Dst[512*(2*y+1) + (2*x+1)] = Src[512*y + x];    // 2x+1  , 2y+1

        }
    }

}









