;
;	Another one that's really hard to do nicely
;

	.export _strcat

	.setcpu 6303
	.code

_strcat:
	tsx
	ldd	5,x
	std	@tmp		; destination
	ldx	3,x		; src
endhunt:
	tst	,x
	beq	copyloop
	inx
	bra	endhunt
copyloop:
	ldaa	,x
	inx
	pshx
	ldx	@tmp
	staa	,x
	inx
	stx	@tmp
	pulx
	tsta
	bne copyloop
	ldd	5,x
	rts
