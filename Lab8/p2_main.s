.data

# syscall constants
PRINT_INT = 1
PRINT_STRING = 4
PRINT_CHAR = 11

.globl newline
newline:    .asciiz "\n"		# useful for printing commands

.globl star
star:	    .asciiz "*"

.globl symbollist
symbollist: .ascii  "0123456789ABCDEFG"

missing_row_board:
.half  4 2 1024 16 32 8192 256 64 2048 32768 128 4096 8 16384 1 512
.half  32768 64 1 8192 8 2048 128 512 256 16384 4 2 16 4096 1024 32
.half  32 512 16384 128 32768 4096 4 16 1 1024 64 8 2 8192 2048 256
.half  4096 8 256 2048 2 16384 1 1024 32 512 8192 16 64 128 4 32768
.half  1024 32 4096 16384 2048 1 16 8192 64 4 512 32768 128 2 256 8
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535
.half  16 256 2 64 1024 32768 16384 4 8 4096 32 128 8192 1 512 2048
.half  128 8192 512 8 4096 64 2 32 16 1 2048 256 32768 4 16384 1024
.half  8 32768 4 256 16 32 1024 2 128 2048 16384 64 4096 512 8192 1
.half  1 2048 128 2 512 4 4096 8 1024 16 32768 8192 256 32 64 16384
.half  16384 4096 8192 1024 64 128 32768 2048 512 256 1 32 4 16 8 2
.half  512 16 64 32 1 256 8192 16384 2 8 4096 4 1024 2048 32768 128
.half  8192 1024 16 512 16384 2 32 32768 4 64 8 2048 1 256 128 4096
.half  256 4 8 1 128 512 64 4096 16384 32 2 1024 2048 32768 16 8192
.half  2 128 2048 32768 4 16 8 1 4096 8192 256 512 16384 1024 32 64
.half  64 16384 32 4096 8192 1024 2048 256 32768 128 16 1 512 8 2 4

missing_column_board:
.half  4 2 1024 65535 32 8192 256 64 2048 32768 128 4096 8 16384 1 512
.half  32768 64 1 65535 8 2048 128 512 256 16384 4 2 16 4096 1024 32
.half  32 512 16384 65535 32768 4096 4 16 1 1024 64 8 2 8192 2048 256
.half  4096 8 256 65535 2 16384 1 1024 32 512 8192 16 64 128 4 32768
.half  1024 32 4096 65535 2048 1 16 8192 64 4 512 32768 128 2 256 8
.half  2048 1 32768 65535 256 8 512 128 8192 2 1024 16384 32 64 4096 16
.half  16 256 2 65535 1024 32768 16384 4 8 4096 32 128 8192 1 512 2048
.half  128 8192 512 65535 4096 64 2 32 16 1 2048 256 32768 4 16384 1024
.half  8 32768 4 65535 16 32 1024 2 128 2048 16384 64 4096 512 8192 1
.half  1 2048 128 65535 512 4 4096 8 1024 16 32768 8192 256 32 64 16384
.half  16384 4096 8192 65535 64 128 32768 2048 512 256 1 32 4 16 8 2
.half  512 16 64 65535 1 256 8192 16384 2 8 4096 4 1024 2048 32768 128
.half  8192 1024 16 65535 16384 2 32 32768 4 64 8 2048 1 256 128 4096
.half  256 4 8 65535 128 512 64 4096 16384 32 2 1024 2048 32768 16 8192
.half  2 128 2048 65535 4 16 8 1 4096 8192 256 512 16384 1024 32 64
.half  64 16384 32 65535 8192 1024 2048 256 32768 128 16 1 512 8 2 4

missing_in_square_board:
.half  4 2 1024 16 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535
.half  32768 64 1 8192 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535
.half  32 512 16384 128 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535
.half  4096 8 256 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535
.half  65535 65535 65535 65535 2048 1 16 8192 65535 65535 65535 65535 65535 65535 65535 65535
.half  65535 65535 65535 65535 256 65535 512 128 65535 65535 65535 65535 65535 65535 65535 65535
.half  65535 65535 65535 65535 1024 32768 16384 4 65535 65535 65535 65535 65535 65535 65535 65535
.half  65535 65535 65535 65535 4096 64 2 32 65535 65535 65535 65535 65535 65535 65535 65535
.half  65535 65535 65535 65535 65535 65535 65535 65535 128 2048 16384 64 65535 65535 65535 65535
.half  65535 65535 65535 65535 65535 65535 65535 65535 1024 16 32768 8192 65535 65535 65535 65535
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 256 1 32 65535 65535 65535 65535
.half  65535 65535 65535 65535 65535 65535 65535 65535 2 8 4096 4 65535 65535 65535 65535
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 1 256 65535 4096
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 2048 32768 16 8192
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 16384 1024 32 64
.half  65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 65535 512 8 2 4

board1:
.half  4 65535 1024 16 65535 65535 256 64 2048 32768 128 65535 8 16384 65535 65535
.half  32768 64 65535 8192 8 2048 65535 512 256 16384 65535 2 16 4096 65535 65535
.half  32 512 16384 65535 32768 4096 65535 16 1 1024 64 8 65535 65535 2048 256
.half  4096 8 256 2048 65535 16384 1 65535 32 512 8192 16 65535 65535 4 32768
.half  65535 32 4096 16384 2048 65535 65535 65535 65535 4 512 65535 128 2 256 8
.half  2048 1 65535 4 256 8 512 128 65535 2 1024 65535 32 64 65535 16
.half  65535 256 2 65535 65535 32768 16384 4 8 4096 32 65535 8192 1 512 65535
.half  128 8192 512 65535 4096 64 65535 32 16 1 2048 256 65535 65535 16384 65535
.half  65535 65535 65535 256 16 32 1024 2 65535 2048 16384 64 4096 512 8192 1
.half  1 2048 65535 2 512 65535 65535 8 1024 16 65535 65535 65535 32 64 16384
.half  16384 4096 65535 65535 65535 128 32768 2048 65535 65535 1 32 4 16 8 65535
.half  512 16 64 32 1 256 65535 65535 2 8 4096 4 65535 2048 32768 128
.half  8192 65535 16 512 16384 2 65535 32768 4 65535 8 2048 1 65535 128 4096
.half  256 4 65535 1 128 512 65535 4096 65535 32 2 1024 2048 32768 65535 8192
.half  2 128 2048 65535 4 16 8 1 4096 65535 65535 65535 16384 1024 32 65535
.half  65535 16384 32 4096 65535 1024 2048 256 32768 128 65535 1 512 8 2 4

board2:
.half  4 2 1024 16 32 8192 256 64 2048 32768 128 4096 8 16384 1 512
.half  32768 64 1 8192 8 2048 128 512 256 16384 4 2 16 4096 1024 32
.half  32 512 16384 128 32768 4096 4 16 1 1024 64 8 2 8192 2048 256
.half  4096 8 256 2048 2 16384 1 1024 32 512 8192 16 64 128 4 32768
.half  1024 32 4096 16384 2048 1 16 8192 64 4 512 32768 128 2 256 8
.half  2048 1 32768 4 256 8 512 128 8192 2 1024 16384 32 64 4096 16
.half  16 256 2 64 1024 32768 16384 4 8 4096 32 128 8192 1 512 2048
.half  128 8192 512 8 4096 64 2 32 16 1 2048 256 32768 4 16384 1024
.half  8 32768 4 256 16 32 1024 2 128 2048 16384 64 4096 512 8192 1
.half  1 2048 128 2 512 4 4096 8 1024 16 32768 8192 256 32 64 16384
.half  16384 4096 8192 1024 64 128 32768 2048 512 256 1 32 4 16 8 2
.half  512 16 64 32 1 256 8192 16384 2 8 4096 4 1024 2048 32768 128
.half  8192 1024 16 512 16384 2 32 32768 4 64 8 2048 1 256 128 4096
.half  256 4 8 1 128 512 64 4096 16384 32 2 1024 2048 32768 16 8192
.half  2 128 2048 32768 4 16 8 1 4096 8192 256 512 16384 1024 32 64
.half  64 16384 32 4096 8192 1024 2048 256 32768 128 16 1 512 8 2 4


.text

# print int and space ##################################################
#
# argument $a0: number to print

print_int_and_space:
	li	$v0, PRINT_INT	# load the syscall option for printing ints
	syscall			# print the number

	li   	$a0, 32        	# print a black space (ASCII 32)
	li	$v0, PRINT_CHAR	# load the syscall option for printing chars
	syscall			# print the char

	jr	$ra		# return to the calling procedure

# print newline ########################################################
#
# no arguments

print_newline:
	li	$v0, 4			# at the end of a line, print a newline char.
	la	$a0, newline
	syscall
	jr	$ra

# main function ########################################################
#
#  this is a function that will test rule1
#

.globl main
main:
	sub	$sp, $sp, 4
	sw	$ra, 0($sp)	# save $ra on stack


## uncomment an additional test case each time you get one working !!!!

 	la	$a0, missing_column_board  # full board missing 1 column
 	jal	rule1
 	la	$a0, missing_column_board
 	jal	print_board                # all "*" should be removed

 	jal     print_newline

  	la	$a0, missing_row_board     # full board missing 1 row
  	jal	rule1
  	la	$a0, missing_row_board
  	jal	print_board                # all "*" should be removed

 	jal     print_newline

  	la	$a0, missing_in_square_board # board with 4 big squares each missing 1 entry
  	jal	rule1
  	la	$a0, missing_in_square_board
  	jal	print_board                # all "*" should be removed

 	jal     print_newline

board1_solve:
  	la	$a0, board1                # board with 4 big squares each missing 1 entry
  	jal	rule1
 	bne	$v0, 0, board1_solve       # keep applying rule1 until the board is solved
  	la	$a0, board1
  	jal	print_board                # all "*" should be removed


	lw	$ra, 0($sp)
	add	$sp, $sp, 4
	jr	$ra
