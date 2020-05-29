; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export	angle;
	import TabSin
	import TabCos
angle	proc
	push {r1} 
	
	ldr	r1, =TabSin
	ldr	r2, =TabCos
	
	ldrsh	r3,[r1,r0, lsl #0x01]
	ldrsh	r12,[r2,r0, lsl #0x01]
	
	mul	r3,r3
	mul	r12,r12
	
	add	r3,r12
	
	pop	{r1}
	str	r3,[r1]
	
	bx	lr
	endp
	end