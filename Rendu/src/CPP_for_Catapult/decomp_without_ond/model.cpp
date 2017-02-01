//
// Created by florentin on 26/01/17.
//

#include "model.h"

ModelA::ModelA() { reset(); }

void ModelA::reset()
{
  for (int i = 0; i < 258; i++)
	cumulative_frequency[i] = i;
  m_bytesProcessed = 0;
  m_frozen = false;
}

inline void ModelA::pacify()
{
  	++m_bytesProcessed ;
}


void inline ModelA::update(int c)
{
  for (int i = c + 1; i < 258; i++)
	cumulative_frequency[i]++;
  if (cumulative_frequency[257] >= MAX_FREQ) {
	m_frozen = true;
  }
}

Prob ModelA::getProbability(int c)
{
  Prob p = {cumulative_frequency[c], cumulative_frequency[c + 1],
			cumulative_frequency[257]};
  if (!m_frozen)
	update(c);
  pacify();
  return p;
}

Prob ModelA::getChar(CODE_VALUE scaled_value, int &c)
{
  pacify();
  for (int i = 0; i < 257; i++)
	if (scaled_value < cumulative_frequency[i + 1]) {
	  c = i;
	  Prob p = {cumulative_frequency[i], cumulative_frequency[i + 1],
				cumulative_frequency[257]};
	  if (!m_frozen)
		update(c);
	  return p;
	}
}

CODE_VALUE ModelA::getCount() {
  return cumulative_frequency[257];
}

