
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
		ADDS	12(%14),12(%14),%0
		ADDS	%0,8(%14),%0
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
		MOV 	$1,-4(%14)
		MOV 	$2,-8(%14)
		MOV 	$3,-12(%14)
		MOV 	$4,-16(%14)
		MOV 	$5,-20(%14)
		MOV 	$6,-24(%14)
		MOV 	$7,-28(%14)
		MOV 	$8,-32(%14)
		MOV 	$9,-36(%14)
		MOV 	$10,-40(%14)
		PUSH	-40(%14)
		PUSH	-36(%14)
		PUSH	-32(%14)
		PUSH	-28(%14)
		PUSH	-24(%14)
		PUSH	-20(%14)
		PUSH	-16(%14)
		PUSH	-12(%14)
		PUSH	-8(%14)
		PUSH	-4(%14)
		PUSH	$0
		PUSH	$1
		PUSH	$9
		CALL	fun
		ADDS	%15,$12,%15
		POP 	-4(%14)
		POP 	-8(%14)
		POP 	-12(%14)
		POP 	-16(%14)
		POP 	-20(%14)
		POP 	-24(%14)
		POP 	-28(%14)
		POP 	-32(%14)
		POP 	-36(%14)
		POP 	-40(%14)
		MOV 	%13,-44(%14)
		ADDS	-8(%14),-8(%14),%0
@usl_izr_begin0:
		CMPS 	-8(%14),-12(%14)
		JEQ 	@usl_izr_true0
@usl_izr_false0:
		MOV 	$2,%1
		JMP	@usl_izr_end0
@usl_izr_true0:
		MOV 	$1,%1
@usl_izr_end0:
		ADDS	%0,%1,%0
		MOV 	%0,-48(%14)
		SUBS	%15,$48,%15
@main_body:
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET