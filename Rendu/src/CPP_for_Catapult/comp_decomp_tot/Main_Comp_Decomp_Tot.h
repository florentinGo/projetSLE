//
// Created by florentin on 25/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_OND_COD_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_OND_COD_H
#include "Compressor.h"
#include "Decompressor.h"
#include "Main_Trans_Ond.h"
#include "Main_Inv_Wave.h"
#include "model.h"
#include <ac_int.h>
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240
class Main_Comp_Decomp_Tot{
public:
  Main_Comp_Decomp_Tot();
  int Main_Fonction(ac_int<8, false> Src[WIDTH_IMAGE*HEIGHT_IMAGE],
					 ac_int<8, false> Comp[WIDTH_IMAGE*HEIGHT_IMAGE],
					 ac_int<8, false> Vga[WIDTH_IMAGE*HEIGHT_IMAGE],
					 uint4 nblevels);


};
#endif //PROJET_IMPLEMENTATION_SLE_MAIN_OND_COD_H
