.global	is_prime         #making is_prime global
is_prime:                #%rax=N
cmpq $1, %rax            #compare N:1
jg .L2                   #if (N>1),jump to loop  .L2
movq $1,%rax             #N=1
ret                      #return N

.L2:                     #loop
                         #%rdi=i,%rsi=temp,%rcx=temp1
movq $2, %rdi            #i=2
movq %rax,%rsi           #temp=N
cqto                     #convert quad word to oct word to avoid floating point exception
idivq %rdi               #N=N/2
addq $1,%rax             #N=N+1
movq %rax,%rcx           #temp1=N
cmpq %rdi, %rax          # Compare N:i
jg .L3                   # if (N>i), jump to loop  .L3
movq $0,%rax             #N=0
ret                      #return 0

.L3:                     #loop
                         #%rcx=temp1
movq %rsi,%rax           #N=temp
cqto                     #convert quad word to oct word to avoid floating point exception
idivq %rdi               #N=N/i
imulq %rdi,%rax          #N=N*i
cmpq %rax,%rsi           #temp:N
je .L4                   #if(temp==N),jump to loop .L4
addq $1,%rdi             #i=i+1
cmpq %rdi,%rcx           #temp1:i
jg .L3                   #if(temp1>i),jump to loop .L3
jmp .L5                  #else jump to loop .L5

.L4:                     #loop
movq $1,%rax             #N=1
ret                      #return 1

.L5:                     #loop
movq $0,%rax             #N=0
ret                      #return 0



