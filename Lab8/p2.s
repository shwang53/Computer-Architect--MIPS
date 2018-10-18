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
##           }
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
			sub 	$sp,  $sp, 	16				#allocating 16bytes on stack.

			sw		$ra, 	0($sp)					# allocate return in stack.

			sw		$s0, 	4($sp)					# creating safe register in stack
			li		$s0,  0								# allocate (i) in safe register.

			sw		$s1, 	8($sp)					# creating safe register in stack
			li		$s1,  0								# allocate (j) in safe register.

			sw		$s2, 	12($sp)					# creating safe register in stack
			move	$s2,  $a0					  	# allocate  (argument) in safe register

rule1_loop:
			mul		$t2,	$s0,	16				# N(size) * i
			add 	$t3,	$t2,	$s1				# N*i +j
			mul		$t4,	$t3,	2					# (N*i +j) * sizeOfElement(2,short)
			add 	$t4,	$s2,	$t4				# &board[i][j]
			lhu		$a0,	0($t4)					# at $a0, dereference board [i][j]

			jal		has_single_bit_set		# jump and link to the function.
			beq 	$v0,	0,		skip 			# if(bool) is false -> go to skip and return false.


			add 	$s1,	$s1,	1					# j++;
			blt 	$s1,	16, 	p2_loop		# if j<16, come back to loop.
			li 		$s1,		0							# reset j = 0

			add 	$s0,	$s0,	1					# i++;
			blt 	$s0,	16, 	p2_loop		# if i<16, come back to loop.

	jr	$ra
