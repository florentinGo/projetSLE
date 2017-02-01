//
// Created by florentin on 25/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_H
#include "Main_Cod_Entropique.h"
#include "Main_Trans_Ond.h"
#include "Main_Decomp.h"
#include "Main_Inv_Wave.h"
#include <ac_int.h>
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240
class Main_Comp_Decomp_tot{
public:
  Main_Comp_Decomp_tot();
  int Main_Fonction(ac_int<8, false> Src[WIDTH_IMAGE*HEIGHT_IMAGE],
					 ac_int<8, false> Comp[WIDTH_IMAGE*HEIGHT_IMAGE],
					ac_int<8, false> Decomp[WIDTH_IMAGE*HEIGHT_IMAGE],
					 ac_int<8, false> Vga[WIDTH_IMAGE*HEIGHT_IMAGE],
					 uint4 nblevels, uint4 change_mode);


};
#endif //PROJET_IMPLEMENTATION_SLE_MAIN_OND_COD_H
