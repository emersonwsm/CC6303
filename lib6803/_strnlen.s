

	.setcpu 6303
	.code
	.export _strnlen


_strnlen:
	tsx
	ldd 3,x			; work out the stop mark
	addd 5,x
	std @tmp		; save it
	ldx 5,x
	clra
	clrb
cl:	tst ,x
	beq to_rts
	inx
	addd @one
	cpx @tmp		; did we hit the stop
	bne cl
to_rts:
	rts
