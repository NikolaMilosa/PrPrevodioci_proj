
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
		MOV 	$2,-24(%14)
		SUBS	%15,$4,%15
@main_body:
		MOV 	$0,-4(%14)
@para0_begin:
		CMPS 	-4(%14),$2
		JGES	@para0_end
		MOV 	$0,-8(%14)
@para1_begin:
		CMPS 	-8(%14),$2
		JGES	@para1_end
		MOV 	$0,-12(%14)
@para2_begin:
		CMPS 	-12(%14),$2
		JGES	@para2_end
		ADDS	-16(%14),$1,%0
		MOV 	%0,-16(%14)
		ADDS	-12(%14),$1,-12(%14)
		JMP	@para2_begin
@para2_end:
		ADDS	-8(%14),$1,-8(%14)
		JMP	@para1_begin
@para1_end:
		ADDS	-4(%14),$1,-4(%14)
		JMP	@para0_begin
@para0_end:
		MOV 	$0,-4(%14)
@para3_begin:
		CMPS 	-4(%14),$2
		JGES	@para3_end
		ADDS	-16(%14),$1,%0
		MOV 	%0,-16(%14)
		ADDS	-4(%14),$1,-4(%14)
		JMP	@para3_begin
@para3_end:
		MOV 	$0,-4(%14)
@para4_begin:
		CMPS 	-4(%14),$2
		JGES	@para4_end
		MOV 	$0,-8(%14)
@para5_begin:
		CMPS 	-8(%14),$2
		JGES	@para5_end
		ADDS	-16(%14),$1,%0
		MOV 	%0,-16(%14)
		ADDS	-8(%14),$1,-8(%14)
		JMP	@para5_begin
@para5_end:
		MOV 	$0,-12(%14)
@para6_begin:
		CMPS 	-12(%14),$2
		JGES	@para6_end
		ADDS	-16(%14),$1,%0
		MOV 	%0,-16(%14)
		ADDS	-12(%14),$1,-12(%14)
		JMP	@para6_begin
@para6_end:
		ADDS	-4(%14),$1,-4(%14)
		JMP	@para4_begin
@para4_end:
		MOV 	-16(%14),%13
		JMP 	@main_exit
@main_exit:
		MOV 	%14,%15
		POP 	%14
		RET