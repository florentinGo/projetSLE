//
// Created by florentin on 26/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MAIN_DECOMP_H
#define PROJET_IMPLEMENTATION_SLE_MAIN_DECOMP_H
#include <ac_int.h>
#include "model.h"
#include "Decompressor.h"
#define WIDTH_IMAGE  320
#define HEIGHT_IMAGE 240

class Main_Decomp
{
  uint32 total_sym; // total of symbols in an image
public:
  Main_Decomp();

  /*Mn_fonction : fonction principale pour la decompression*/
  void Mn_Fonction(ac_int<8, false> *Src,
				   ac_int<8, false> *Dst,
  int comp_size);
};
#endif //PROJET_IMPLEMENTATION_SLE_MAIN_DECOMP_H
