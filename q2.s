.global	gcd_calc     #making quotient_calc global
gcd_calc:            #%rdi=N,%rsi=M,%rax=temp1,%rbx=temp2
movq %rdi,%rax       #temp1=N
movq %rsi,%rbx       #temp2=M
cmpq $0,%rax         #compare N:0
je .L100             #if(N==0),jump to loop .L100
jle .L101             #elseif(N<0),jump to loop  .L101
cmpq $0,%rbx         #compare M:0
je .L100             #if(N==0),jump to loop  .L100
jle .L102             #elseif(N<0),jump to loop .L102
jmp .L103            #if none of above conditions hold,jump to .L103

.L100:               #loop
addq %rbx,%rax       #N=N+M
ret                  #return N

.L101:               #loop
imulq $-1,%rdi       #N=N*-1
movq %rdi,%rax       #temp1=N
cmpq $0,%rsi         #compare M:0
je .L100             #if(M==0),jump to loop .L101
jle .L102            #else if(M<0),jump to loop .L102
jmp .L103            #else jump to .L103

.L102:               #loop
imulq $-1,%rsi       #M=M*-1
movq %rsi,%rbx       #temp2=M
jmp .L103            #jump to .L103

.L103:               #loop
cmpq %rsi,%rdi       #compare N:M
jne .L104            #if(N!=M),jump to loop .L104
ret                  #else return temp1

.L104:               #loop
cmpq %rsi,%rdi       #compare N:M
jg .L105             #if(N>M) jump to loop .L105
jmp .L106            #else jump to loop .L106

.L105:               #loop
subq %rsi,%rdi       #N=N-M
movq %rdi,%rax       #temp1=N
jmp .L103            #jump to loop .L103

.L106:               #loop
subq %rdi,%rsi       #M=M-N
jmp .L103            #jump to loop .L103
