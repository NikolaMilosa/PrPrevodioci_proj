
normFun:
		PUSH	%14
		MOV 	%15,%14
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
@normFun_body:
		MOV 	$5,%13
		JMP 	@normFun_exit
@normFun_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
@main_body:
		PUSH	$1
		PUSH	$2
		PUSH	$3
		CALL	fun1
		ADDS	%15,$12,%15
		MOV 	%13,-4(%14)
		PUSH	$1
		PUSH	$2
		CALL	fun2
		ADDS	%15,$8,%15
		MOV 	%13,-8(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET
fun1:
		PUSH	%14
		MOV 	%15,%14
@fun1_body:
		MOV 	$5,12(%14)
		MOV 	12(%14),%13
		JMP 	@fun1_exit
@fun1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
fun2:
		PUSH	%14
		MOV 	%15,%14
@fun2_body:
		MOV 	$5,8(%14)
		MOV 	8(%14),%13
		JMP 	@fun2_exit
@fun2_exit:
		MOV 	%14,%15
		POP 	%14
		RET