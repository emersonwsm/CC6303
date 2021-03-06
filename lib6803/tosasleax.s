;
;	Left shift 32bit signed
;
	.export tosasleax
	.export tosshleax

	.setcpu 6803
	.code

;
;	TODO: optimize 8, 16 steps on asl and asr cases
;
tosasleax:	
tosshleax:
	cmpb	#32
	bcc	ret0
	tstb
	beq noshift
	tsx
loop:
	asl	6,x
	rol	5,x
	rol	4,x
	rol	3,x
	decb
	bne loop
	ldd	3,x
	; Get the value
	std	@sreg
	ldd	5,x
noshift:
	jmp pop4
ret0:
	clra
	clrb
	std	@sreg
	bra	noshift
