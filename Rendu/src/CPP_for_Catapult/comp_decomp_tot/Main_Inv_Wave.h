//
// Created by florentin on 27/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_INV_WAVE_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_INV_WAVE_H
#include "globals.h"
#include <ac_int.h>
class Main_Inv_Wave
{
public:
  void  Mn_Inv_Wave_Fct(ac_int<8, false> Data[HEIGHT_IMAGE * WIDTH_IMAGE],
					ac_int<8, false> Comp[HEIGHT_IMAGE * WIDTH_IMAGE],
					int nbLevels, int quality);

  /* Fonction qui réalise un niveau de la décompression.
  La taille de l'image à traiter est défninie par hi(hauteur) et wi(largeur)
  L'image finale est écrite dans la mémoire Dst.
  */
  void Inv_Wave(ac_int<8, false> Data[HEIGHT_IMAGE * WIDTH_IMAGE],
						 ac_int<8, false> Comp[HEIGHT_IMAGE * WIDTH_IMAGE],
						 int height_image, int width_image);

  /* Fonction agrandissant l'image Src en doublant sa hauteur (hi) et sa
  * largeur
  * (wi)
  */
  void image_agrandir(ac_int<8, false> Src[HEIGHT_IMAGE * WIDTH_IMAGE],
							 ac_int<8, false> Dst[HEIGHT_IMAGE * WIDTH_IMAGE],
							 int hi, int wi);

  /* Copie d'une image
*	Src : Mémoire où est stockée l'image source
*	Dst : Mémoire où stocker l'image à copier
*	hi  : Hauteur de l'image à copier
*	wi  : Largeur de l'image à copier
*/
  void image_copy(ac_int<8,false> Src[HEIGHT_IMAGE*WIDTH_IMAGE],
				  ac_int<8,false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE],
				  int height_image, int width_image);

};

#endif //PROJET_IMPLEMENTATION_SLE_MAIN_INV_WAVE_H
