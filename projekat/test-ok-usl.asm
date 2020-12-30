
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-4(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-8(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-12(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-16(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-20(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-24(%14)
		SUBS	%15,$4,%15
@main_body:
		MOV 	$2,-16(%14)
		MOV 	$3,-20(%14)
		MOV 	$2,-4(%14)
		MOV 	$3,-8(%14)
		CMPS 	-4(%14),-8(%14)
@usl_izr_begin0:
		JGTS	@usl_izr_false0
@usl_izr_true0:
		MOV 	-4(%14),%0
		JMP	@usl_izr_end0
		@usl_izr_false0:
		ADDS	-8(%14),-4(%14),%1
		MOV 	%1,%0
		JMP	@usl_izr_end0
@usl_izr_end0:
		ADDS	$1,%0,%0
		CMPU 	-16(%14),-20(%14)
@usl_izr_begin1:
		JGEU	@usl_izr_false1
@usl_izr_true1:
		MOV 	-8(%14),%1
		JMP	@usl_izr_end1
		@usl_izr_false1:
		MOV 	-4(%14),%1
		JMP	@usl_izr_end1
@usl_izr_end1:
		ADDS	%0,%1,%0
		MOV 	%0,-4(%14)
		ADDS	-8(%14),-8(%14),%0
		ADDS	%0,-8(%14),%0
		CMPS 	-4(%14),%0
@usl_izr_begin2:
		JGES	@usl_izr_false2
@usl_izr_true2:
		MOV 	-4(%14),%0
		JMP	@usl_izr_end2
		@usl_izr_false2:
		MOV 	-8(%14),%0
		JMP	@usl_izr_end2
@usl_izr_end2:
		MOV 	%0,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET