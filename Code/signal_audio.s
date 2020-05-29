; ce programme est pour l'assembleur RealView (Keil)
	thumb

	area  variables, data, readwrite
	import teta

	area  signal_carre, code, readonly
E_POS	equ	0
E_TAI	equ	4
E_SON	equ	8
E_RES	equ	12
E_PER	equ	16

TIM3_CCR3	equ	0x4000043C	; adresse registre PWM
	
;
; On défini le callback pour la génération du signal
;
timer_callback	proc
	export	timer_callback
		;On va alors récupérer les informations sur l'état
	ldr	r0, =teta		
	ldr	r1, [r0, #E_POS]		
	ldr	r2, [r0, #E_SON]		
	ldr	r3, [r2, r1]		
	
	ldr	r1, =TIM3_CCR3		
	str	r3, [r1]		
	endp	
	end
