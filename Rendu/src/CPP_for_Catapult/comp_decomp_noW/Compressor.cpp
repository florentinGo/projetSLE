//
// Created by florentin on 26/01/17.
//

#include "Compressor.h"
Compressor::Compressor(ModelA &model,uint8 *dst)
	: m_model(model), byte_to_encode(0), nxt_byte(false), first_digit(false), m_output(WIDTH_IMAGE*HEIGHT_IMAGE,dst)
{

}

int Compressor::compress(uint8 *src)
{
	int pending_bits = 0;
	CODE_VALUE low = 0;
	CODE_VALUE high = MAX_CODE;
	for (;;) {
		int c = getByte(src);

		if (c == -1)
			c = 256;
		Prob p = m_model.getProbability(c);
		CODE_VALUE range = high - low + 1;
		high = low + (range * p.high / p.count) - 1;
		low = low + (range * p.low / p.count);
		//
		// On each pass there are six possible configurations of high/low,
		// each of which has its own set of actions. When high or low
		// is converging, we output their MSB and upshift high and low.
		// When they are in a near-convergent state, we upshift over the
		// next-to-MSB, increment the pending count, leave the MSB intact,
		// and don't output anything. If we are not converging, we do
		// no shifting and no output.
		// high: 0xxx, low anything : converging (output 0)
		// low: 1xxx, high anything : converging (output 1)
		// high: 10xxx, low: 01xxx : near converging
		// high: 11xxx, low: 01xxx : not converging
		// high: 11xxx, low: 00xxx : not converging
		// high: 10xxx, low: 00xxx : not converging
		//
		for (;;) {
			if (high < ONE_HALF)
				put_bit_plus_pending(0, pending_bits);
			else if (low >= ONE_HALF)
				put_bit_plus_pending(1, pending_bits);
			else if (low >= ONE_FOURTH &&
					high < THREE_FOURTHS) {
				pending_bits++;
				low -= ONE_FOURTH;
				high -= ONE_FOURTH;
			} else
				break;
			high <<= 1;
			high++;
			low <<= 1;
			high &= MAX_CODE;
			low &= MAX_CODE;
		}
		if (c == 256) // 256 is the special EOF code
			break;
	}
	pending_bits++;
	if (low < ONE_FOURTH)
		put_bit_plus_pending(0, pending_bits);
	else
		put_bit_plus_pending(1, pending_bits);
	return m_output.index_range;
}

inline void Compressor::put_bit_plus_pending(bool bit, int &pending_bits)
{
	m_output.put_bit(bit);
	for (int i = 0; i < pending_bits; i++)
		m_output.put_bit(!bit);
	pending_bits = 0;
}

int Compressor::getByte(uint8 *src)
{
	if (byte_to_encode >= 320 * 240)
	{
		return -1;
	}
	return src[byte_to_encode++];
}

