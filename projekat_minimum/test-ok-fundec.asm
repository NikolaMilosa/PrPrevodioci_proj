
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
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
		MOV 	$4,-12(%14)
	SUBS	%15,$4,%15
		MOV 	-12(%14),-4(%14)
		MOV 	-12(%14),-8(%14)
		MOV 	$5,-16(%14)
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
	SUBS	%15,$4,%15
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
		MOV 	%13,-28(%14)
	SUBS	%15,$4,%15
		MOV 	-28(%14),-20(%14)
		MOV 	-28(%14),-24(%14)
		ADDS	-12(%14),-12(%14),%0
@usl_izr_begin0:
		CMPS 	-12(%14),-16(%14)
		JEQ 	@usl_izr_true0
@usl_izr_false0:
		MOV 	$2,%1
		JMP	@usl_izr_end0
@usl_izr_true0:
		MOV 	$1,%1
@usl_izr_end0:
		ADDS	%0,%1,%0
		MOV 	%0,-32(%14)
	SUBS	%15,$4,%15
@main_body:
		MOV 	-24(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET