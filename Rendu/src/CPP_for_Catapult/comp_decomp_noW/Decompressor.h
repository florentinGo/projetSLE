//
// Created by florentin on 26/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_DECOMPRESSOR_H
#define PROJET_IMPLEMENTATION_SLE_DECOMPRESSOR_H

#include "Exchange.h"
#include "globals.h"
#include "model.h"
#include <ac_int.h>


class Decompressor
{

public:
Decompressor(ModelA &model, uint8 *src, int comp_size,uint8 *dst);
  int decompress();

private:
  ModelA &m_model;
  Input m_input;
  Output m_output;
};
#endif //PROJET_IMPLEMENTATION_SLE_DECOMPRESSOR_H
