#include "model.h"
#include "globals.h"
#include "Exchange.h"
#define OFFSET 15

//
// The arithmetic compressor is a general purpose compressor that
// is parameterized on the types of the input, output, and
// model objects, in an attempt to make it as flexible as
// possible. It is easiest to use by calling the compress()
// convenience function found at the bottom of this header file
//
//

class Compressor
{

	public:
		Compressor(ModelA &model,uint8 *dst);

		int compress(uint8 *src);

		inline void put_bit_plus_pending(bool bit, int &pending_bits);

		int getByte(uint8 *src);

	private:
		ModelA &m_model;
		Output m_output;
		int byte_to_encode;
		bool nxt_byte;
		bool first_digit;
};

