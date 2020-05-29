#include "./Lib/gassp72.h"
extern short TabSig[];
extern short TabCos[];
extern short TabSin[];
extern short TabSig_1[];
extern short TabSig_2[];
extern short TabSig_3[];

void angle(int i, int *j);
int m2(short* s, int k);
int dft(short* s, int k, short * tab);


int main(void)
{ 
	int tab[63];
	for (int i = 1; i <= 63; i++){
		tab[i-1] = m2(TabSig_2, i);
	}
	
	while	(1)
	{
		
	}
}
