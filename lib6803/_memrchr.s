		.export _memrchr
		.setcpu 6803
		.code

_memrchr:
		tsx
		ldd 7,x
		dex			; as we are working from the end
					; not start+len
		std @tmp2		; end mark
		addd 3,x
		std @tmp		; end to start from
		ldab 6,x
		ldx @tmp
		; Must do the compare before the end check, see the C
		; standard.
		bra memchrn
memrchrl:
		cmpb ,x
		beq strmatch
		dex
memchrn:
		cpx @tmp2
		bne memrchrl
		clra
		clrb
		rts
strmatch:
		stx @tmp
		ldd @tmp
		rts
