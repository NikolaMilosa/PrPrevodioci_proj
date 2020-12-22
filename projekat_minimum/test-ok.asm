
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
		ADDS	12(%14),8(%14),%0
		MOV 	%0,16(%14)
		MOV 	16(%14),%13
		JMP 	@fun_exit
@fun_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		PUSH	$1
		PUSH	$1
		PUSH	$1
		CALL	fun
		ADDS	%15,$12,%15
		MOV 	%13,%0
		PUSH	$1
		PUSH	$1
		PUSH	$1
		CALL	fun
		ADDS	%15,$12,%15
		MOV 	%13,%1
		ADDS	%0,%1,%0
		MOV 	%0,-8(%14)
		MOV 	$3,-12(%14)
		SUBS	%15,$12,%15
@main_body:
		PUSH	$0
		PUSH	$3
		PUSH	$8
		CALL	fun
		ADDS	%15,$12,%15
		MOV 	%13,%0
		ADDS	%0,$5,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),-12(%14),%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET