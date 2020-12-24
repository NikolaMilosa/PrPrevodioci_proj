
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
		MOV 	$5,8(%14)
		MOV 	8(%14),%13
		JMP 	@fun_exit
@fun_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$12,%15
@main_body:
		MOV 	$5,-8(%14)
		MOV 	$20,-4(%14)
		MOV 	$1,-12(%14)
		MOV 	-8(%14),%0
		ADDS	-8(%14), $1, -8(%14)
	PUSH	%0
	POP 	%0
		MOV 	$5,%1
		ADDS	%0,%1,%0
	PUSH	%0
	POP 	%0
		MOV 	$0,%1
		ADDS	%0,%1,%0
		MOV 	%0,%1
		ADDS	%0,%1,