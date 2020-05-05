		.export _strchr
		.setcpu 6803
		.code

_strchr:
		tsx
		ldab 4,x
		ldx 5,x
		; Must do the compare before the end check, see the C
		; standard.
_strchrl:
		cmpb ,x
		beq strmatch
		tst ,x
		beq retnull
		inx
		bra _strchrl
strmatch:
		stx @tmp
		ldd @tmp
		rts
retnull:
		clra
		clrb
		rts
