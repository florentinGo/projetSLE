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

/* Fonction qui réalise la transformée en ondelettes de l'image écrite dans la mémoire Src.
   Le niveau de compression réalisé est égal à nbLevels.
   L'image finale est écrite dans la mémoire Dst.
*/
void Main_Trans_Ond (ac_int<8,false> Data[256*512],
            		 ac_int<8,false> Comp[256*512],
					 int nbLevels);

/* Fonction qui réalise un niveau de la transformée en ondelettes de l'image écrite dans la mémoire Src.
   La taille de l'image à traiter est défninie par hi(hauteur) et wi(largeur)
   L'image finale est écrite dans la mémoire Dst.
*/
void Trans_Ond (ac_int<8,false> Data[256*512],
				ac_int<8,false> Comp[256*512],
				int height_image, int width_image);

ac_int<8,false> moy(ac_int<8,false> v1, ac_int<8,false> v2);  

ac_int<8,false> sub(ac_int<8,false> v1, ac_int<8,false> v2);  

/* Recopie l'image Src dans Dst
 */
void image_copy(ac_int<8,false> Src[256*512],
				ac_int<8,false> Dst[256*512],
				int height_image, int width_image);
