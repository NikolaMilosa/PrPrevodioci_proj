
a:
		WORD	1
b:
		WORD	1
c:
		WORD	1
f:
		WORD	1
d:
		WORD	1
e:
		WORD	1
vfunc:
		PUSH	%14
		MOV 	%15,%14
@vfunc_body:
		MOV 	$5,8(%14)
		MOV 	$5,c
@vfunc_exit:
		MOV 	%14,%15
		POP 	%14
		RET
ifunc:
		PUSH	%14
		MOV 	%15,%14
@ifunc_body:
		MOV 	$4,8(%14)
		MOV 	$2,12(%14)
		MOV 	$2,16(%14)
		MOV 	$5,a
		MOV 	8(%14),%13
		JMP 	@ifunc_exit
@ifunc_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$16,%15
@main_body:
		MOV 	$0,-4(%14)
		PUSH	$1
		PUSH	%1
		PUSH	%2
		CALL	ifunc
		ADDS	%15,$12,%15
		MOV 	%13,%0
		ADDS	a,%0,%0
		MOV 	%0,a
		MOV 	$0,-8(%14)
@para0_begin:
		CMPS 	-8(%14),$5
		JGES	@para0_end
		ADDS	-8(%14),$1,-8(%14)
		ADDS	a,$1,a
		JMP	@para0_begin
@para0_end:
@1check0_when0:
		CMPS 	-4(%14),$0
		JNE	@1check0_when1
@1check0_when0_body:
		ADDS	a,$3,%0
		MOV 	%0,a
		JMP	@1check0_end
@1check0_when1:
		CMPS 	-4(%14),$1
		JNE	@1check0_when2
@1check0_when1_body:
		MOV 	$2,-4(%14)
		JMP	@1check0_when2_body
@1check0_when2:
@1check0_when2_body:
		ADDS	-4(%14),$2,%0
		MOV 	%0,-4(%14)
@1check0_end:
		MOV 	a,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET