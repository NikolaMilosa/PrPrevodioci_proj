
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$2,-4(%14)
		SUBS	%15,$4,%15
		SUBS	%15,$4,%15
		MOV 	$5,-12(%14)
		SUBS	%15,$4,%15
		MOV 	-12(%14),-4(%14)
@main_body:
		MOV 	-4(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET