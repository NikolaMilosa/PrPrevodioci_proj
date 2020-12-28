
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
		MOV 	$3,-20(%14)
		SUBS	%15,$4,%15
		MOV 	$0,-24(%14)
		SUBS	%15,$4,%15
@main_body:
		MOV 	$0,-4(%14)
@para0_begin:
		CMPS 	-4(%14),$5
		JGES	@para0_end
		ADDS	-8(%14),-4(%14),%0
		MOV 	%0,-8(%14)
@1check0_when0:
		CMPS 	-4(%14),$1
		JNE	@1check0_when1
@1check0_when0_body:
		MOV 	$3,-12(%14)
		JMP	@1check0_end
@1check0_when1:
		CMPS 	-4(%14),$2
		JNE	@1check0_when2
@1check0_when1_body:
@1check1_when0:
		CMPS 	-16(%14),$1
		JNE	@1check1_when1
@1check1_when0_body:
@1check2_when0:
		CMPS 	-12(%14),$3
		JNE	@1check2_when1
@1check2_when0_body:
		MOV 	$0,-8(%14)
		JMP	@1check2_end
@1check2_when1:
		CMPS 	-12(%14),$2
		JNE	@1check2_when2
@1check2_when1_body:
		MOV 	$2,-8(%14)
		JMP	@1check2_end
@1check2_when2:
@1check2_when2_body:
@1check2_end:
		JMP	@1check1_when1_body
@1check1_when1:
		CMPS 	-16(%14),$0
		JNE	@1check1_when2
@1check1_when1_body:
@1check2_when0:
		CMPS 	-12(%14),$3
		JNE	@1check2_when1
@1check2_when0_body:
		MOV 	$0,-8(%14)
		JMP	@1check2_end
@1check2_when1:
		CMPS 	-12(%14),$2
		JNE	@1check2_when2
@1check2_when1_body:
		MOV 	$2,-8(%14)
		JMP	@1check2_end
@1check2_when2:
@1check2_when2_body:
@1check2_end:
@1check2_when0:
		CMPS 	-16(%14),$2
		JNE	@1check2_when1
@1check2_when0_body:
		MOV 	$0,-8(%14)
		JMP	@1check2_when1_body
@1check2_when1:
		CMPS 	-16(%14),$3
		JNE	@1check2_when2
@1check2_when1_body:
		MOV 	$2,-8(%14)
		JMP	@1check2_when2_body
@1check2_when2:
@1check2_when2_body:
@1check2_end:
		JMP	@1check1_when2_body
@1check1_when2:
@1check1_when2_body:
@1check1_end:
		JMP	@1check0_when2_body
@1check0_when2:
@1check0_when2_body:
@1check0_end:
		ADDS	-4(%14),$1,-4(%14)
		JMP	@para0_begin
@para0_end:
		MOV 	-8(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET