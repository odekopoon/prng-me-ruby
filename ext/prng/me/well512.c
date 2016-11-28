/*

   WELL512 PRNG Algorithm
   C/C++ code written by Chris Lomont, www.lomont.org
   quote from http://lomont.org/Math/Papers/2008/Lomont_PRNG_2008.pdf

 */
#include <stdio.h>
#include <string.h>
#include "genrand.h"

#define KEY_LENGTH 16
/* initialize state to random bits  */
static unsigned int state[KEY_LENGTH] = {0x304d0c18U,0x38024410U,0x7636513eU,0xbef1d83aU,0x91b6f2f1U,0x5a46e44cU,0x51b081ceU,0x72f205a9U,0xd99ead80U,0x2b94bd63U,0x3c55544dU,0xf9e6e69bU,0xe8fbdab7U,0x16c2015fU,0x229ca001U,0x0e0de97aU};

/* init should also reset this to 0 */
static unsigned int idx = 0;

void init_by_array(unsigned int init_key[], int key_length)
{
	idx = 0;
	memcpy(state, init_key, sizeof(int) * key_length);
}

/* return 32 bit random number      */
unsigned int genrand_int32(void)
{
	unsigned int a, b, c, d;
	a = state[idx];
	c = state[(idx+13)&15];
	b = a^c^(a<<16)^(c<<15);
	c = state[(idx+9)&15];
	c ^= (c>>11);
	a = state[idx] = b^c;
	d = a^((a<<5)&0xDA442D24U);
	idx = (idx + 15)&15;
	a = state[idx];
	state[idx] = a^b^d^(a<<2)^(b<<18)^(c<<28); return state[idx];
}
