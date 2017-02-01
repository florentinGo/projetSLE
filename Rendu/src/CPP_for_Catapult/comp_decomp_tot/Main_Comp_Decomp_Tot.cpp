//
// Created by florentin on 25/01/17.
//

#include "Main_Comp_Decomp_Tot.h"

Main_Comp_Decomp_Tot::Main_Comp_Decomp_Tot(){}

int Main_Comp_Decomp_Tot::Main_Fonction(ac_int<8, false> Src[WIDTH_IMAGE*HEIGHT_IMAGE],
		ac_int<8, false> Comp[WIDTH_IMAGE*HEIGHT_IMAGE],
		ac_int<8, false> Vga[WIDTH_IMAGE*HEIGHT_IMAGE],
		uint4 nblevels) {
	Main_Trans_Ond trans_ond;
  Main_Inv_Wave inv_wave;
  	int comp_size;
  	ModelA cmodel;
  trans_ond.Mn_Trans_Ond(Src,Comp,nblevels);
  Compressor comp( cmodel,Src);
  comp_size = comp.compress(Comp);
  trans_ond.image_copy(Src,Comp,HEIGHT_IMAGE,WIDTH_IMAGE);
  cmodel.reset();
  Decompressor dec(cmodel, Comp, comp_size,Vga);
  dec.decompress();
  trans_ond.image_copy(Vga,Comp,HEIGHT_IMAGE,WIDTH_IMAGE);
  inv_wave.Mn_Inv_Wave_Fct(Comp,Vga,nblevels,0);
  return comp_size;
}


