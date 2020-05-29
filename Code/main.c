#include "../Lib/gassp72.h"

#define CLOCK_FREQ 72000000

extern long PeriodeSonMicroSec;
extern long LongueurSon;
extern short Son[];

typedef struct {
	int position;			// index courant dans le tableau d'echantillons
	int taille;				// nombre d'echantillons de l'enregistrement
	short int * son;	// adresse de base du tableau d'echantillons en ROM
	int resolution;		// pleine echelle du modulateur PWM
	int Tech_en_Tck;	// periode d'ech. audio en periodes d'horloge CPU
} type_etat;

type_etat teta;

void timer_callback(void);

int main(void)
{
	teta.position = 0;
	teta.taille = LongueurSon;
	teta.son = Son;
	teta.Tech_en_Tck = PeriodeSonMicroSec * 0.001 * CLOCK_FREQ;
	
	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// config port PB0 pour être utilisé par TIM3-CH3
	GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	// config TIM3-CH3 en mode PWM
	teta.resolution = PWM_Init_ff(TIM3, 3, teta.Tech_en_Tck);
	
	Active_IT_Debordement_Timer(TIM3, 2, timer_callback);
	
	Run_Timer(TIM3);
	
while	(1)
	{
	}
}
