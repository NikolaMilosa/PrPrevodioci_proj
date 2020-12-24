
fun:
		PUSH	%14
		MOV 	%15,%14
@fun_body:
	PUSH	%0
	PUSH	%1
	PUSH	%2
	PUSH	%3
	PUSH	%4
	PUSH	%5
	PUSH	%6
	PUSH	%7
	PUSH	%8
	PUSH	%9
	PUSH	%10
	PUSH	%11
	PUSH	%12
		MOV 	$5,8(%14)
		MOV 	8(%14),%13
		JMP 	@fun_exit
	POP 	%12
	POP 	%11
	POP 	%10
	POP 	%9
	POP 	%8
	POP 	%7
	POP 	%6
	POP 	%5
	POP 	%4
	POP 	%3
	POP 	%2
	POP 	%1
	POP 	%0
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
		ADDS	$5,$5,%1
		ADDS	%0,%1,%0
		ADDS	$5,$5,%1
		ADDS	%0,%1,%0
		MOV 	%0,-8(%14)
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET