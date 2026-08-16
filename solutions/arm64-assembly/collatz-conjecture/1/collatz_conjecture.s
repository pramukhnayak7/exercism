.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
        cmp        x0, #0
        ble        invalid
        mov        x1,#0

loop: 
        cmp        x0,#1
        beq        done
        and        x2,x0,#1
        cbz        x2, even
        add        x0,x0,x0,lsl #1 
        add        x0, x0, #1
        b        count
even: 
        lsr        x0,x0,#1
count:
        add        x1,x1,#1
        b        loop
done:
        mov x0,x1
        ret
invalid:
        mov x0, #INVALID_NUMBER
        ret