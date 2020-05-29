; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area	moncode, code, readonly
	export	dft;
		
		
dft	proc	
	
	push	{r4 - r6}
	
	mov	r3, #0			
	mov	r4, #0	
	
bcl	ldrsh	r5, [r0, r3, lsl #1]	

	mul	r6, r1, r3		
	and	r6, #0x3F	
	
	ldrsh	r6, [r2, r6, lsl #1]	
	mla	r4, r5, r6, r4	
	add	r3, #1		
	cmp	r3, #64
	
	bne	bcl	
	mov	r0, r4	
	pop	{r4 - r6}
	
	
	bx	lr
	endp

	
	
	
	import 	TabSin
	import	TabCos
	export 	m2
		
m2	proc
	
	push 	{lr, r0}
	
	ldr	r2, =TabCos
	bl	dft
	smull	r0, r12, r0, r0		
	pop	{r0}		
	
	ldr	r2, =TabSin	
	bl	dft
	smlal	r0, r12, r0, r0	
	mov	r0, r12
	pop	{pc}
	
	endp
	end