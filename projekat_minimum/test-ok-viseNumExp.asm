
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
		MOV 	$5,-4(%14)
		MOV 	$3,-12(%14)
		ADDS	$5,$5,%0
		PUSH	%0
		POP 	%0
		ADDS	%0,$5,%0
		MOV 	%0,-8(%14)
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET