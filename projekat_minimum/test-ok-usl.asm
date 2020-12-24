
main:
		PUSH	%14
		MOV 	%15,%14
		SUBS	%15,$24,%15
@main_body:
		MOV 	$2,-16(%14)
		MOV 	$3,-20(%14)
		MOV 	$2,-4(%14)
		MOV 	$3,-8(%14)
		MOV 	-4(%14),%0
		ADDS	-4(%14),%0,%0
		MOV 	-4(%14),%1
		ADDS	-8(%14),%1,%1
@usl_izr_begin0:
		CMPS 	-4(%14),-8(%14)
		JLES	@usl_izr_true0
@usl_izr_false0:
		MOV 	%1,%2
		JMP	@usl_izr_end0
@usl_izr_true0:
		MOV 	%0,%2
@usl_izr_end0:
		MOV 	%2,%1
		ADDS	$1,%1,%0
	PUSH	%0
@usl_izr_begin1:
		CMPU 	-16(%14),-20(%14)
		JLTU	@usl_izr_true1
@usl_izr_false1:
		MOV 	-4(%14),%0
		JMP	@usl_izr_end1
@usl_izr_true1:
		MOV 	-8(%14),%0
@usl_izr_end1:
	POP 	%1
		MOV 	%0,%2
		ADDS	%1,%2,%0
		MOV 	%0,-4(%14)
		MOV 	-8(%14),%0
		ADDS	-8(%14),%0,%0
	PUSH	%0
	POP 	%0
		MOV 	-8(%14),%1
		ADDS	%0,%1,%0
@usl_izr_begin2:
		CMPS 	-4(%14),%0
		JLTS	@usl_izr_true2
@usl_izr_false2:
		MOV 	-8(%14),%1
		JMP	@usl_izr_end2
@usl_izr_true2:
		MOV 	-4(%14),%1
@usl_izr_end2:
		MOV 	%1,-4(%14)
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET