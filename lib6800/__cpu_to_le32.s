
	.export __cpu_to_le32
	.export __le32_to_cpu
	.export __be32_to_cpu
	.export __cpu_to_be32

	.code

__cpu_to_le32:
__le32_to_cpu:
	; The argument is top of stack 3,s-6,s
	tsx
	ldaa 3,x
	ldab 4,x
	psha
	pshb
	ldaa 5,x
	ldab 6,x
	stab 3,x
	staa 4,x
	pulb
	pula
	staa 5,x
	stab 6,x
__cpu_to_be32:
__be32_to_cpu:
	rts
