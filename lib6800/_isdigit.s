
		.export _isdigit

		.code

_isdigit:
		clra
		tsx
		ldab 4,x
		cmpb #'0'
		blo fail
		cmpb #'9'
		bhi fail
		; Any non zero value is valid
		rts
fail:		clrb
		rts