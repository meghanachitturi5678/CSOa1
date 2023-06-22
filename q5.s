.global	sum_squares                         #making sum_squares global
sum_squares:                                #%rax=sum,%si=limit
movq $0, %rax                               # sum = 0
movq $0x7FFFFFFFFFFFFFFF,%rsi               #limit=$0x7FFFFFFFFFFFFFFF

.L2:                                        # loop:
                                            #%rdi=N,%rbx=temp,%rax=sum
movq %rdi,%rbx                              #temp=N
cmpq $0,%rdi                                #compare N:0
jg .L3                                      #if N>0, jump to loop .L3
movq $-1,% rax                              #sum=-1
ret                                         #return -1

.L3:                                        #loop
movq %rdi,%rbx                              #temp=n
imulq %rdi,%rdi                             #N=N*N
addq  %rdi,%rax                             #sum=sum+N*N
cmpq  $0,%rax                               #compare sum:0
jl .L4                                      #if(sum<0),jump to loop .L4
jmp .L6                                     #else jump to loop .L6

.L4:                                        #loop
addq %rsi,%rax                              #sum=sum+limit
jmp .L5                                     #jump to loop .L5

.L5:                                        #loop
movq %rbx,%rdi                              #N=temp                             
subq $1, %rdi                               # N=N-1
cmpq $0, %rdi                               # Compare N:0
jg .L3                                      # if N>0, jump to loop .L3
ret                                         #else return sum

.L6:                                        #loop
                                            #%rdx=remainder(when idivq called)
cqto                                        #convert quad word to oct word to avoid floating point exception
idivq %rsi                                  #sum=sum/limit
cmpq $0,%rdx                                #compare remainder:0
jl .L9                                      #if(remainder<0),jump to loop .L9
movq %rdx,%rax                              #else sum=remainder
jmp .L5                                     #jump to loop .L5

.L9:                                        #loop
addq %rsi,%rdx                              #remainder=remainder+limit
movq %rdx,%rax                              #sum=remainder
jmp .L5                                     #jump to loop .L5

