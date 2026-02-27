.section .text
.global find_hamming        # initialize function

#Call function
find_hamming:
    xor %eax, %eax          # reset total distance

char_loop:

    movb (%rdi), %bl        # load char from str1
    movb (%rsi), %cl        # load char from str2

    cmp $0, %bl             # if first char is empty 
    je done

    cmp $0, %cl             # if second char is empty
    je done

    xor %cl, %bl            # bl = differing bits

    mov $8, %rdx            # 8 bits per character

#Check bit hamming
bit_loop:

    mov %bl, %bh            # check if both bits are equal
    and $1, %bh

    cmp $0, %bh             # if equal, skip to next step
    je skip_add

    add $1, %eax            # increase hamming distance

#Go to next bit/char
skip_add:

    shr $1, %bl             # next bit in differing bits

    dec %rdx                # check new num of loops needed
    cmp $0, %rdx
    jne bit_loop

    inc %rdi                # check next chars of both strings
    inc %rsi
    jmp char_loop

#End function
done:
    ret

.section .note.GNU-stack,"",@progbits
