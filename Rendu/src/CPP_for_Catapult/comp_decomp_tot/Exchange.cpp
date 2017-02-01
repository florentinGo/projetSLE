//
// Created by florentin on 26/01/17.
//

#include "Exchange.h"

Output::Output(int max, ac_int<8,false> *Dst):m_NextByte(0), m_Mask(0x80),
											  index_range(0),max_range(max),Dst(Dst){}

void Output::put_bit(bool bit) {

  if (bit)
	m_NextByte |= m_Mask;
  m_Mask >>= 1;
  if (!m_Mask) {
	putByte(m_NextByte);
	m_Mask = 0x80;
	m_NextByte = 0;
  }


}
void Output::putByte(char byte){
	if(index_range < max_range){
	  Dst[index_range] = ac_int<8, false>(byte);
	  index_range ++;
	}
}
Output::~Output() {
  if (m_Mask != 0x80)
	putByte(m_NextByte);
}


Input::Input(uint8 src[HEIGHT_IMAGE*WIDTH_IMAGE], int code_value_bits, int maxRange)
	: src_(src), m_CurrentByte(0), m_LastMask(1),
	m_CodeValueBits(code_value_bits), maxRange_(maxRange), input_byte(0)
{}

bool Input::get_bit()
{
	if (m_LastMask == 1) {
		m_CurrentByte = src_[input_byte++];
		if (m_CurrentByte < 0) {
			if (m_CodeValueBits > 0)
			{
			  m_CodeValueBits -= 8;
			}


		}
		m_LastMask = 0x80;
	} else
		m_LastMask >>= 1;
	return (m_CurrentByte & m_LastMask) != 0;
}

