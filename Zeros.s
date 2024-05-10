.data
prompt: .asciiz "Enter an Integer: "
positive: .asciiz "\nPositive number provided"
negative: .asciiz "\nNegative number provided"
notZero: .asciiz "\nNon-Zero provided"
zero: .asciiz "\nZero provided"
goodbye: .asciiz "\nRerun program to use it again"

.text

#Print prompt
li $v0, 4
la $a0, prompt # address of string to print
syscall

#Get the input
li $v0, 5
syscall

#Store the Integer
move $t1, $v0

#Check if positive, negative, zero, or not zero
beq $t1, $zero, IsZero
blt $t1, $zero, IsNegative

li $v0, 4
la $a0, positive # address of string to print
syscall

li $v0, 4
la $a0, notZero 
syscall

j Exit

IsNegative:
li $v0, 4
la $a0, negative # address of string to print
syscall
j Exit

IsZero:
li $v0, 4
la $a0, zero 
syscall
j Exit

Exit:
li $v0, 4
la $a0, goodbye # address of string to print
syscall


