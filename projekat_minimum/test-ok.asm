
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
		ADDS	12(%14),16(%14),%0
		MOV 	%0,8(%14)
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
		PUSH	$0
		PUSH	$3
		PUSH	$8
		CALL	fun
		ADDS	%15,$12,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET