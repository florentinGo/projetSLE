////////////////////////////////////////////////////////////////////////////////
// Company:        ENSIMAG
// Engineer:       Fondevilla Mathieu, Yu Wanwan
// 
// Create Date:    08:11:44 11/10/2015 
// Design Name: 
// Module Name:    MAIN header for Catapult C 
// Project Name:   JPEG2000 & HLS
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////
#include "ac_int.h"
#include "globals.h"

/* Fonction qui réalise la décompression de l'image transformée en ondelettes écrite dans la mémoire Src.
   Le niveau de compression subi par l'image réalisé est renseigné par nbLevels.
   Le niveau de décompression souhaité est renseigné par quality.
   L'image finale est écrite dans la mémoire Dst.
*/
void Main_Decomp_Ond (ac_int<8,false> Data[256*512],
            ac_int<8,false> Comp[256*512],
			int nbLevels,
			int quality);

/* Fonction qui réalise un niveau de la décompression.
   La taille de l'image à traiter est défninie par hi(hauteur) et wi(largeur)
   L'image finale est écrite dans la mémoire Dst.
*/
void Decomp_Ond (ac_int<8,false> Data[256*512],
			ac_int<8,false> Comp[256*512],
			int height_image, int width_image);

/* Fonction agrandissant l'image Src en doublant sa hauteur (hi) et sa largeur (wi)
 */
void image_agrandir(ac_int<8,false> Src[256*512], ac_int<8,false> Dst[256*512], int hi, int wi);

