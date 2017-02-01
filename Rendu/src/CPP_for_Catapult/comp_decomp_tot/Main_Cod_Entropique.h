//
// Created by florentin on 24/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_COD_ENTROPIQUE_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_COD_ENTROPIQUE_H
#include <ac_int.h>
#include "model.h"
#include "Compressor.h"
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240


class Main_Cod_Entropique
{
	public:
		Main_Cod_Entropique();

		/*Mn_fonction : fonction principale pour l'utilisation des pixels sur 8 bits*/
		int Mn_Fonction(uint16 width, uint16 height,
				ac_int<8, false> Src[HEIGHT_IMAGE * WIDTH_IMAGE],
				ac_int<8, false> Dst[HEIGHT_IMAGE*WIDTH_IMAGE]);
};

#endif //PROJET_IMPLEMENTATION_SLE_MAIN_COD_ENTROPIQUE_H
