.globl get_square_begin
get_square_begin:
	# round down to the nearest multiple of 4
	div	$v0, $a0, 4
	mul	$v0, $v0, 4
	jr	$ra


# UNTIL THE SOLUTIONS ARE RELEASED, YOU SHOULD COPY OVER YOUR VERSION FROM LAB 7
# (feel free to copy over the solution afterwards)
.globl has_single_bit_set
has_single_bit_set:
	bne		$a0,	 0,	 next			# if value !=0, go to next.
	li 		$v0,	 0						# if value == 0, return 0.
	jr 		$ra									# Exit

next:
	sub	 	$t1, $a0, 	1						# t1 = value -1
	and	  $t2, $a0, 	$t1					# t2 = value & (value-1)

	beq	  $t2, 	 0, 	final				# if(value & value-1 == 0), go to final
	li		$v0,	 0								# return 0
	jr		$ra											# Exit

final:
	li 		$v0,		1						 # return 1.
	jr		$ra									 # Exit



# UNTIL THE SOLUTIONS ARE RELEASED, YOU SHOULD COPY OVER YOUR VERSION FROM LAB 7
# (feel free to copy over the solution afterwards)
get_lowest_set_bit:
	li		$t0, 			0 			   	#i = 0

loop:
	li 		   	$t3,	 	 		1								  	# store $t3 = 1.
	sllv		  $t2, 	    	$t3,			$t0				# $t2 = (1 << t)
	and		    $t1, 	    	$a0, 			$t2				# $t1 = value & (1 << i)
	bne 		  $t1, 		  	0,		   	final2		# if $t1 != 0, go to final2 and return i.

	add 	  	$t0,		   $t0,		    1			  	# i++
	blt 		  $t0,			 16, 	  		loop		  # i<16

	li 		  	$v0, 				0									  # if nothing was returned, return 0/
	jr		  	$ra													  	# Exit

final2:
	move 	  	$v0,			$t0									  # return i.
	jr		    $ra								     				  # Exit


# UNTIL THE SOLUTIONS ARE RELEASED, YOU SHOULD COPY OVER YOUR VERSION FROM LAB 7
# (feel free to copy over the solution afterwards)
.globl print_board
print_board:
				sub 	$sp,  $sp, 	16				#allocating 16bytes on stack.

				sw		$ra, 	0($sp)					# allocate return in stack.

				sw		$s0, 	4($sp)					# creating safe register in stack
				li		$s0,  0								# allocate (i) in safe register.

				sw		$s1, 	8($sp)					# creating safe register in stack
				li		$s1,  0								# allocate (j) in safe register.

				sw		$s2, 	12($sp)					# creating safe register in stack
				move	$s2,  $a0					  	# allocate  (argument) in safe register



p22_loop :
				mul		$t2,	$s0,	16				# N(size) * i
				add 	$t3,	$t2,	$s1				# N*i +j
				mul		$t4,	$t3,	2					# (N*i +j) * sizeOfElement(2,short)
				add 	$t4,	$s2,	$t4				# &board[i][j]

				lhu		$a0,	0($t4)					# at $a0, value = board [i][j]

				jal		has_single_bit_set		# jump and link to the function.
				bne 	$v0,	0,	 p22_skip 	# if(bool) is true -> go to skip

				#putchar(c)
				li		$a0,	'*'
				li		$v0,  11
				syscall

dine_printing_char:
				add 	$s1,	$s1,	1				  	# j++;
				blt 	$s1,	16, 	p22_loop  	# if j<16, come back to loop.

				#putchar('\n')
				li		$a0,	'\n'
				li		$v0,   11
				syscall

				li 		$s1,		0						  	# reset j = 0

				add 	$s0,	$s0,	1				    # i++;
				blt 	$s0,	16, 	p22_loop		# if i<16, come back to loop.


				lw		$ra,	0($sp)					# load return value again.
				lw 		$s0, 	4($sp)					# load s0 to i again
				lw 		$s1, 	8($sp)					# load s1 to j again
				lw		$s2, 	12($sp)					# load s2 to argument again
				add 	$sp,  $sp, 	16				# clear the memory.
				jr		$ra										# Exit


p22_skip:

				mul		$t2,	$s0,	16				# N(size) * i
				add 	$t3,	$t2,	$s1				# N*i +j
				mul		$t4,	$t3,	2					# (N*i +j) * sizeOfElement(2,short)
				add 	$t4,	$s2,	$t4				# &board[i][j]
				lhu		$a0,	0($t4)					# at $a0, value = board [i][j]

				#int num = get_lowest_set_bit(value) + 1;
				jal		get_lowest_set_bit
				add   $t5,	$v0,	1

				# c = symbollist[num];
				la 		$t6, symbollist
				add 	$t6,	$t5,	$t6				#
				lbu		$a0,	0($t6)					#
				li		$v0,   11
				syscall

				j			dine_printing_char

p22_note:

				lw		$ra,	0($sp)					# load return value again.
				lw 		$s0, 	4($sp)					# load s0 to i again
				lw 		$s1, 	8($sp)					# load s1 to j again
				lw		$s2, 	12($sp)					# load s2 to argument again
				add 	$sp,  $sp, 	16				# clear the memory.
				jr		$ra										# Exit
