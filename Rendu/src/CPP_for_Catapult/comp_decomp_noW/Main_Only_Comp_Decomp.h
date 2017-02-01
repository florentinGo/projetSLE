//
// Created by florentin on 01/02/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_ONLY_COMP_DECOMP_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_ONLY_COMP_DECOMP_H
#include "Main_Cod_Entropique.h"
#include "Main_Decomp.h"
#include <ac_int.h>
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240
class Main_Only_Comp_Decomp{
public:
  Main_Only_Comp_Decomp();
  int Main_Fonction(ac_int<8, false> *Src,
					ac_int<8, false> *Comp,
					ac_int<8, false> *Vga,
					uint4 nblevels);


};
#endif //PROJET_IMPLEMENTATION_SLE_MAIN_ONLY_COMP_DECOMP_H
