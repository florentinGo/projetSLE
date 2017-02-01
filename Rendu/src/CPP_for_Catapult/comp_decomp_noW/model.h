//
// Created by florentin on 26/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_MODEL_H
#define PROJET_IMPLEMENTATION_SLE_MODEL_H
#include "globals.h"
#include <ac_int.h>

struct Prob {
  CODE_VALUE low;
  CODE_VALUE high;
  CODE_VALUE count;
};

struct ModelA {
  // variables used by the model

  CODE_VALUE cumulative_frequency[258]; // Character a is defined by the range
  // cumulative_frequency[a],
  // cumulative_frequency[a+1], with cumulative_frequency[257]
  // containing the total count for the model. Note that entry
  // 256 is the EOF.
  unsigned long long m_bytesProcessed;

  ModelA();

  void reset();

  inline void pacify();


  void inline update(int c);

  Prob getProbability(int c);

  Prob getChar(CODE_VALUE scaled_value, int &c);

  CODE_VALUE getCount();

  bool m_frozen;
};
#endif //PROJET_IMPLEMENTATION_SLE_MODEL_H
