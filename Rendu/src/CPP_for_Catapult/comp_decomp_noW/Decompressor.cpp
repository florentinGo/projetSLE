//
// Created by florentin on 26/01/17.
//

#include "Decompressor.h"

Decompressor::Decompressor(ModelA &model, uint8 *src, int comp_size,uint8 *dst):m_model(model), m_output(WIDTH_IMAGE*HEIGHT_IMAGE,dst),
  m_input(src, CODE_VALUE_BITS, comp_size){
}

int Decompressor::decompress()
{
  CODE_VALUE high = MAX_CODE;
  CODE_VALUE low = 0;
  CODE_VALUE value = 0;
  for (int i = 0; i < CODE_VALUE_BITS; i++) {
	value <<= 1;
	value += m_input.get_bit() ? 1 : 0;
  }
  for (;;) {
	CODE_VALUE range = high - low + 1;
	CODE_VALUE scaled_value =
		((value - low + 1) * m_model.getCount() - 1) / range;

	int c;
	Prob p = m_model.getChar(scaled_value, c);
	if (c == 256)
	  break;
	m_output.putByte(c);

	high = low + (range * p.high) / p.count - 1;
	low = low + (range * p.low) / p.count;
	for (;;) {
	  if (high < ONE_HALF) {
		// do nothing, bit is a zero
	  } else if (low >= ONE_HALF) {
		value -= ONE_HALF; // subtract one half from all
		// three code values
		low -= ONE_HALF;
		high -= ONE_HALF;
	  } else if (low >= ONE_FOURTH &&
		  high < THREE_FOURTHS) {
		value -= ONE_FOURTH;
		low -= ONE_FOURTH;
		high -= ONE_FOURTH;
	  } else
		break;
	  low <<= 1;
	  high <<= 1;
	  high++;
	  value <<= 1;
	  value += m_input.get_bit() ? 1 : 0;
	}
  }
  return 0;
}

