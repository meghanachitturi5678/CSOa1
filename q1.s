.global	quotient_calc     #making quotient_calc global
quotient_calc:            #%rdi=M,%rsi=N,%rbx=temp
movq %rsi,%rbx            #temp=N
cmpq $0, %rdi             #compare  M:0
je .L1                    #if M==0,jump to loop .L1
cmpq $0, %rsi             #compare N:0
je .L2                    #if N==0,jump to loop .L2
jg  .L3                   #if N>0,jump to loop .L3
jle  .L4                  #else jump to loop .L4


.L1:                      #loop
                          #%rax=return
cmpq $0, %rsi             #compare N:0
je .L2                    #if N==0,jump to loop .L2
movq $0,%rax              #return=0
ret                       #return 0

.L2:                      #loop
movq $-1,%rax             #return=-1
ret                       #return -1

.L3:                      #loop
                          #%rdx=quotient
movq $0, %rdx             #quotient=0
cmpq $0, %rdi             # M:0
jg .L5                    #if M>0,jump to loop .L5
jle  .L6                  #else jump to loop .L6


.L4:                      #loop
                          #%rdx=quotient
movq $0, %rdx             #quotient=0
cmpq $0, %rdi             #Compare M:0
jg .L7                    #if M>0,jump to loop .L7
jle  .L8                  #else jump to loop .L8

.L5:                      #loop
subq $1,%rsi              #N=N-1
cmpq %rsi,%rdi            #Compare M:N
jg .L9                    #if M>N,jump to loop .L9
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L6:                      #loop
addq %rdi,%rsi            #N=N+M
cmpq $0,%rsi              #Compare N:0
jle .L10                  #if M<=0,jump to loop .L10
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L7:                      #loop
addq %rdi,%rsi            #N=N+M
cmpq $-1,%rsi             #Compare N:-1
jg .L11                   #if N>-1,jump to loop .L11
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L8:                      #loop
cmpq %rsi,%rdi            #Compare M:N
jle .L12                  #if M<=N,jump to loop .L12
movq %rdx,%rax            #else return=quotient
ret                       #return quotient
 
.L9:                      #loop
movq %rbx,%rsi            #N=temp
subq %rsi,%rdi            #M=M-N
addq $1,%rdx              #quotient=quotient+1
subq $1,%rsi              #N=N-1
cmpq %rsi,%rdi            #Compare M:N
jg .L9                    #if M>N,jump to loop .L9
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L10:                     #loop
movq %rbx,%rsi            #N=temp
addq %rsi,%rdi            #M=M+N
addq $1,%rdx              #quotient=quotient+1
addq %rdi,%rsi            #N=N+M
cmpq $0,%rsi              #Compare N:0
jle .L10                  #if M<=0,jump to loop .L10
imulq $-1,%rdx            #quotient=quotient*-1
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L11:                     #loop
movq %rbx,%rsi            #N=temp
addq %rsi,%rdi            #M=M+N
addq $1,%rdx              #quotient=quotient+1
addq %rdi,%rsi            #N=N+M
cmpq $-1,%rsi             #Compare N:-1
jg .L11                   #if N>-1,jump to loop .L11
imulq $-1,%rdx            #quotient=quotient*-1
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.L12:                     #loop
subq %rsi,%rdi            #M=M-N
addq $1,%rdx              #quotient=quotient+1
cmpq %rsi,%rdi            #Compare M:N
jle .L12                  #if M<=N,jump to loop .L12
movq %rdx,%rax            #else return=quotient
ret                       #return quotient

.global	remainder_calc    #making remainder_calc global
remainder_calc:           #%rdi=M,%rsi=N,%rdx=quotient        
cmpq $-1,%rdx             #Compare quotient:-1
je .L13                   #if quotient==-1,jump to loop .L13
imulq  %rsi,%rdx          #quotient=quotient*N
subq    %rdx,%rdi         #M=M-quotient
movq %rdi,%rax            #return=quotient 
ret                       #return quotient


.L13:                     #loop
movq %rdx,%rax            #return=quotient
ret                       #return quotient  
