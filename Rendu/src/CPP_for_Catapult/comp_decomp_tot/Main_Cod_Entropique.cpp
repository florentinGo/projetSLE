//
// Created by florentin on 22/11/16.
//

#include "Main_Cod_Entropique.h"


Main_Cod_Entropique::Main_Cod_Entropique()
{}


int Main_Cod_Entropique::Mn_Fonction(uint16 width, uint16 height,
		ac_int<8, false>
		Src[WIDTH_IMAGE*HEIGHT_IMAGE],
		ac_int<8, false>
		Dst[WIDTH_IMAGE*HEIGHT_IMAGE])
{
	ModelA cmodel;
	Compressor comp( cmodel,Dst);
	return comp.compress(Src);

}

