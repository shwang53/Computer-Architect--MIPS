.text

## bool
## rule1(unsigned short board[GRID_SQUARED][GRID_SQUARED]) {
##   bool changed = false;
##   for (int i = 0 ; i < GRID_SQUARED ; ++ i) {
##     for (int j = 0 ; j < GRID_SQUARED ; ++ j) {
##       unsigned value = board[i][j];

##       if (has_single_bit_set(value)) {
##         for (int k = 0 ; k < GRID_SQUARED ; ++ k) {
##           // eliminate from row
##           if (k != j) {
##             if (board[i][k] & value) {
##               board[i][k] &= ~value;
##               changed = true;
##             }
##           } next1
##           // eliminate from column
##           if (k != i) {
##             if (board[k][j] & value) {
##               board[k][j] &= ~value;
##               changed = true;
##             }
##           }
##         }
##
##         // elimnate from square
##         int ii = get_square_begin(i);
##         int jj = get_square_begin(j);
##         for (int k = ii ; k < ii + GRIDSIZE ; ++ k) {
##           for (int l = jj ; l < jj + GRIDSIZE ; ++ l) {
##             if ((k == i) && (l == j)) {
##               continue;
##             }
##             if (board[k][l] & value) {
##               board[k][l] &= ~value;
##               changed = true;
##             }
##           }
##         }
##       }

##     }
##   }
##   return changed;
## }

.globl rule1
rule1:
			sub 	$sp,  $sp, 	28				#allocating 20bytes on stack.

			sw		$ra, 	0($sp)					# allocate return in stack.

			sw		$s0, 	4($sp)					# creating safe register in stack
			li		$s0,  0								# allocate (i) in safe register.

			sw		$s1, 	8($sp)					# creating safe register in stack
			li		$s1,  0								# allocate (j) in safe register.

			sw		$s2, 	12($sp)					# creating safe register in stack
			move	$s2,  $a0					  	# allocate  (argument) in safe register

			sw		$s3, 	16($sp)					# creating safe register in stack
			li		$s3,  0				  			# allocate  (bool changed) in safe register

			sw 		$s4,	20($sp)
			sw		$s5,	24($sp)					#t1 stored

rule1_loop:
			mul		$t0,	$s0,	16				# N(size) * i
			add 	$t0,	$t0,	$s1				# N*i +j
			mul		$t0,	$t0,	2					# (N*i +j) * sizeOfElement(2,short)
			add 	$t0,	$s2,	$t0				# &board[i][j]
			lhu		$a0,	0($t0)					# at $a0(value), dereference board [i][j]
			move 	$s4,	$a0 						 # s4 = value

			jal		has_single_bit_set		# jump and link to the function.

			beq 	$v0,	0,	skip_in_loop 			# if(bool) is false -> go to skip_in_loop

			li		$t1,	0								# k = 0;
			move 	$s5,	$t1

first_loop:
			## for loop again ##
			beq 	$s5,	$s1,	next1				#k == j ? go next1

			mul		$t2,	$s0,	16					# N(size) * i
			add 	$t2,	$t2,	$s5					# N*i + k(t1)
			mul		$t2,	$t2,	2						# (N*i +k) * sizeOfElement(2,short)
			add 	$t2, 	$s2,	$t2					# &board[i][k]
			lhu		$t3,	0($t2)						# t3 = board[i][k]

#if (board[i][k] & value)
			and 	$t4,	$s4, 	$t3					# t4 = board[i][k] & value
			beq		$t4,	0,	next1					# if false, next1

			not 	$t5,	$s4								# ~value
			and 	$t3,	$t3,	$t5					# board[i][k] &= ~value
			li		$s3,		1								# changed = true;

next1:
			beq 	$s5,	$s0,	next2				#k == i ? go next2

			mul		$t6,	$s5,	16					#  N(size) * k
			add 	$t6,	$t6,	$s1					#  N*k +j
			mul		$t6,	$t6,	2						# (N*k +j) * sizeOfElement(2,short)
			add 	$t6,	$s2,	$t6					# &board[k][j]
			lhu		$t7,	0($t6)						# at $t7, dereference board [k][j]

#if (board[k][j] & value)
			and 	$t4,	$s4,	$t7
			beq		$t4,	0,	next2

			not 	$t5,	$s4								# ~value
			and 	$t4,	$t5,	$t4					# board[i][k] &= ~value
			li		$s3,		1								# changed = true;

next2:
			add 	$s5,	$s5,	1						# k++;
			blt 	$s5,	16,	first_loop		# if k<4, come back to first_loop
			#li		$s5,	0									# k = 0 reset.


body1:
			move	$a0,	$s0
			jal		get_square_begin
			move	$t8, $v0								# int ii = get_square_begin(i);

			move	$a0,	$s1
			jal		get_square_begin
			move	$t9, $v0								# int jj = get_square_begin(j);

			move		$t1,	$t8							# k = ii
			move		$t2,	$t9							# l = jj

			add 		$t8, 	$t8,	4
			add 		$t9,	$t9,	4

second_loop:


			mul		$t3,	$t1,	16				  # N(size) * k
			add 	$t3,	$t3,	$t2				# N*k +l
			mul		$t3,	$t3,	2					# (N*k +l) * sizeOfElement(2,short)
			add 	$t3,	$s2,	$t3				# &board[k][l]
			lhu		$t6,	0($t3)					# at $a0(value), dereference board [i][j]

			bne  	$t1,	$s0,	next3			#two conditional
			bne 	$t2,	$s1, 	next3
			j			next4

next3:

			and 	$t6,	$s4,	$t6
			beq		$t6,	0,	next4

			not 	$t5,	$s4									# ~value
			and 	$t6,	$t5,	$t6						# board[i][k] &= ~value
			li		$s3,		1									# changed = true;


next4:
			add 	$t2,	$t2,	1							# l++;
			blt 	$t2,	$t9, 	second_loop		# if l<4, come back to loop.
			li 		$t2,		0									# reset j = 0

			add 	$t1,	$t1,	1							# k++;
			blt 	$t1,	$t8, 	second_loop		# if k<4, come back to loop.



skip_in_loop:

			add 	$s1,	$s1,	1					# j++;
			blt 	$s1,	16, 	rule1_loop		# if j<16, come back to loop.
			li 		$s1,		0							# reset j = 0

			add 	$s0,	$s0,	1					# i++;
			blt 	$s0,	16, 	rule1_loop		# if i<16, come back to loop.


finally:
			move 	$v0,	$s3							# return v0 = changed.

			lw		$ra,	0($sp)					# load return value again.
			lw 		$s0, 	4($sp)					# load s0 to i again
			lw 		$s1, 	8($sp)					# load s1 to j again
			lw		$s2, 	12($sp)					# load s2 to (argument) again
			lw		$s3, 	16($sp)					# load s3 to (changed) again
			lw		$s4,	20($sp)
			lw		$s5,	24($sp)
			add 	$sp,  $sp, 	28				# clear the memory.
			jr		$ra										# Exit
