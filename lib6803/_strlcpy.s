
		.export _strlcpy

		.setcpu 6803
		.code

_strlcpy:
		tsx
		ldd 3,x		; size limit
		addd 5,x	; source limit marker
		std @tmp
		ldd 7,x		; dest
		std @tmp2
		ldx 5,x		; source
loop:
		ldab ,x
		beq end		; null terminator
		pshx
		ldx @tmp2	; copy byte
		stab ,x
		inx
		stx @tmp2
		pulx
		inx
		cpx @tmp	; source hit limit ?
		bne loop
		; We ran out of space
		dex
		clr ,x
		tsx		; if we ran out of space we copied size
		ldd 3,x
		rts
end:
		ldx @tmp2	; get the destination
		clr ,x		; clear the final byte
		tsx
		ldd @tmp2	; end byte
		addd @one	; +1
		subd 3,x	; - start (size used)
		rts
