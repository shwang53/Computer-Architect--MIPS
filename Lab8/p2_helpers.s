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
	jr	$ra


# UNTIL THE SOLUTIONS ARE RELEASED, YOU SHOULD COPY OVER YOUR VERSION FROM LAB 7
# (feel free to copy over the solution afterwards)
get_lowest_set_bit:
	jr	$ra


# UNTIL THE SOLUTIONS ARE RELEASED, YOU SHOULD COPY OVER YOUR VERSION FROM LAB 7
# (feel free to copy over the solution afterwards)
.globl print_board
print_board:
	jr	$ra
