
func:
		PUSH	%14
		MOV 	%15,%14
@func_body:
@1check0_when0:
		CMPS 	8(%14),$3
		JNE	@1check0_when1
@1check0_when0_body:
		MOV 	$5,8(%14)
		JMP	@1check0_when1_body
@1check0_when1:
@1check0_when1_body:
		MOV 	$4,8(%14)
@1check0_end:
		MOV 	8(%14),%13
		JMP 	@func_exit
@func_exit:
		MOV 	%14,%15
		POP 	%14
		RET
main:
		PUSH	%14
		MOV 	%15,%14
		MOV 	$0,-8(%14)
		SUBS	%15,$24,%15
@main_body:
		ADDS	$2,$5,%0
		ADDS	%0,$11,%0
		PUSH	%0
		PUSH	%1
		CALL	func
		ADDS	%15,$8,%15
		MOV 	%13,%0
		MOV 	%0,-4(%14)
@2check0_when0:
		CMPS 	-4(%14),$1
		JNE	@2check0_when1
@2check0_when0_body:
		ADDS	-4(%14),$5,%0
		MOV 	%0,-8(%14)
		JMP	@2check0_when1_body
@2check0_when1:
		CMPS 	-4(%14),$4
		JNE	@2check0_when2
@2check0_when1_body:
		MOV 	$3,-8(%14)
		JMP	@2check0_end
@2check0_when2:
@2check0_when2_body:
		ADDS	-4(%14),-8(%14),%0
		MOV 	%0,-4(%14)
@2check0_end:
@3check0_when0:
		CMPU 	-16(%14),$2
		JNE	@3check0_when1
@3check0_when0_body:
		ADDU	-20(%14),$3,%0
		MOV 	%0,-20(%14)
		JMP	@3check0_end
@3check0_when1:
		CMPU 	-16(%14),$3
		JNE	@3check0_when2
@3check0_when1_body:
		MOV 	$5,-4(%14)
		MOV 	$3,-8(%14)
		JMP	@3check0_end
@3check0_when2:
@3check0_when2_body:
@3check0_end:
@4check0_when0:
		CMPS 	-4(%14),$4
		JNE	@4check0_when1
@4check0_when0_body:
@4check1_when0:
		CMPS 	-8(%14),$3
		JNE	@4check1_when1
@4check1_when0_body:
		MOV 	$5,-8(%14)
		JMP	@4check1_when1_body
@4check1_when1:
@4check1_when1_body:
@4check1_end:
		JMP	@4check0_when1_body
@4check0_when1:
		CMPS 	-8(%14),$2
		JNE	@4check0_when2
@4check0_when1_body:
		ADDS	-8(%14),$2,%0
		MOV 	%0,-8(%14)
		JMP	@4check0_end
@4check0_when2:
@4check0_when2_body:
@4check0_end:
		ADDS	-8(%14),-4(%14),%0
		MOV 	%0,%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET