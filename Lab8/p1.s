.text

##int
##dfs(int* tree, int i, int input) {
##	if (i >= 127) {
##		return -1;
##	}
##	if (input == tree[i]) {
##		return 0;
##	}
##
##	int ret = DFS(tree, 2 * i, input);
##	if (ret >= 0) {
##		return ret + 1;
##	}
##	ret = DFS(tree, 2 * i + 1, input);
##	if (ret >= 0) {
##		return ret + 1;
##	}
##	return ret;
##}

.globl dfs

dfs:
		sub		$sp,	$sp,	16
    move 	$s2,  $a1
		sw		$ra,	0($sp)
		sw		$s0,	4($sp)
		sw		$s1,	8($sp)
		sw		$s2,	12($sp)



		move	$s0,	$a2								# s0 = input
		mul		$t0,	$a1,	4						# i *4 (int 4bytes)
		add 	$s1,	$a0,	$t0					#	s1 = tree[i]
		lw		$s1,	0($s1)						#	s1 = tree[i]

ifs:
		##tree = $a0, i = $a1, input = $a2
		bge		$a1,	127,	return_minus_one
		beq		$s0,	$s1,	return_zero

		##	int ret = DFS(tree, 2 * i, input);
		##	if (ret >= 0) {
		##		return ret + 1;
		##	}

		lw		$a1,	12($sp)
		mul		$a1,	$a1,	2
		jal		dfs
		move	$t1,	$v0
		bge		$t1,	0,	return_ret_plus_one

		lw		$a1,	12($sp)
		mul		$a1,	$a1,	2
		add   $a1,	$a1,	1
		jal		dfs
		move	$t1,	$v0
		bge		$t1,	0,	return_ret_plus_one

		move	$v0,	$t1

		lw		$ra,	0($sp)					# load return value again.
		lw 		$s0, 	4($sp)					# load s0 to i again
		lw 		$s1, 	8($sp)					# load s1 to j again
		lw		$s2, 	12($sp)					# load s2 to argument again
		add 	$sp,  $sp, 	16				# clear the memory.
		jr		$ra


return_minus_one:

		li		$v0,	-1

		lw		$ra,	0($sp)					# load return value again.
		lw 		$s0, 	4($sp)					# load s0 to i again
		lw 		$s1, 	8($sp)					# load s1 to j again
		lw		$s2, 	12($sp)					# load s2 to argument again
		add 	$sp,  $sp, 	16				# clear the memory.

		jr		$ra


return_zero:
		li		$v0,	0

		lw		$ra,	0($sp)					# load return value again.
		lw 		$s0, 	4($sp)					# load s0 to i again
		lw 		$s1, 	8($sp)					# load s1 to j again
		lw		$s2, 	12($sp)					# load s2 to argument again
		add 	$sp,  $sp, 	16				# clear the memory.

		jr		$ra

return_ret_plus_one:
		add		$t1,  $t1, 1
		move	$v0,	$t1

		lw		$ra,	0($sp)					# load return value again.
		lw 		$s0, 	4($sp)					# load s0 to i again
		lw 		$s1, 	8($sp)					# load s1 to j again
		lw		$s2, 	12($sp)					# load s2 to argument again
		add 	$sp,  $sp, 	16				# clear the memory.


		jr 		$ra
