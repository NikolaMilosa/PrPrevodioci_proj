
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
		ADDS	12(%14),12(%14),%0
		PUSH	%0
		POP 	%0
		ADDS	%0,8(%14),%0
		MOV 	%0,16(%14)
		MOV 	16(%14),%13
		JMP 	@fun_exit
@fun_exit:
		MOV 	%14,%15
		POP 	%14
		RET
fun1:
		PUSH	%14
		MOV 	%15,%14
@fun1_body:
		PUSH	$0
		PUSH	$0
		PUSH	$0
		CALL	fun
		ADDS	%15,$12,%15
		PUSH	%13
		POP 	%0
		ADDS	%0,12(%14),%0
		PUSH	%0
		POP 	%0
		ADDS	%0,8(%14),%0
		MOV 	%0,12(%14)
		MOV 	12(%14),%13
		JMP 	@fun1_exit
@fun1_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$3,-4(%14)
		MOV 	$3,-8(%14)
		MOV 	$3,-12(%14)
		PUSH	$0
		PUSH	$1
		PUSH	$9
		CALL	fun
		ADDS	%15,$12,%15
	MOV 	-24(%14),-12(%14)
	MOV 	-20(%14),-8(%14)
	MOV 	-16(%14),-4(%14)
		MOV 	%13,-16(%14)
		ADDS	-8(%14),-8(%14),%0
		PUSH	%0
@usl_izr_begin0:
		CMPS 	-8(%14),-12(%14)
		JEQ 	@usl_izr_true0
@usl_izr_false0:
		MOV 	$2,%0
		JMP	@usl_izr_end0
@usl_izr_true0:
		MOV 	$1,%0
@usl_izr_end0:
		POP 	%1
		ADDS	%1,%0,%0
		MOV 	%0,-20(%14)
		SUBS	%15,$20,%15
@main_body:
		PUSH	$3
		PUSH	$3
		CALL	fun1
		ADDS	%15,$8,%15
		PUSH	%13
		PUSH	$0
		PUSH	$3
		PUSH	$8
		CALL	fun
		ADDS	%15,$12,%15
		POP 	%0
		ADDS	%0,%13,%0
		PUSH	%0
		PUSH	$4
		PUSH	$5
		CALL	fun1
		ADDS	%15,$8,%15
		POP 	%0
		ADDS	%0,%13,%0
		PUSH	%0
		PUSH	$0
		PUSH	$0
		PUSH	$0
		CALL	fun
		ADDS	%15,$12,%15
		POP 	%0
		ADDS	%0,%13,%0
		MOV 	%0,-4(%14)
		MOV 	-12(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET