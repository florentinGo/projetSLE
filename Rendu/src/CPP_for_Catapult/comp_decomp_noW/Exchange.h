//
// Created by florentin on 26/01/17.
//

#ifndef PROJET_IMPLEMENTATION_SLE_INPUT_H
#define PROJET_IMPLEMENTATION_SLE_INPUT_H
#include <ac_int.h>
#include "globals.h"
class Output{
  uint32 max_range;
  char m_NextByte;
  unsigned char m_Mask;
  ac_int<8,false> *Dst;

public:
  uint32 index_range;
  Output( int max, ac_int<8,false> *Dst);
  ~Output();
  void put_bit(bool bit);
  void putByte(char byte);

};

class Input
{
  public:
	Input(uint8 src[HEIGHT_IMAGE*WIDTH_IMAGE], int code_value_bits, int maxRange);
	bool get_bit();

  private:
	uint8 *src_;	
	int m_CurrentByte;
	unsigned char m_LastMask;
	uint32 maxRange_;
	int m_CodeValueBits;
	int input_byte;
};
#endif //PROJET_IMPLEMENTATION_SLE_INPUT_H

