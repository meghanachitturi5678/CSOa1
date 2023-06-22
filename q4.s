.global	is_prime         #making is_prime global
is_prime:                #%rax=n
cmpq $1, %rax            #compare n:1
jg .L2                   #if n>1,jump to loop .L2
movq $1,%rax             #n=1
ret                      #return n

.L2:                     #loop
                         #%rdi=i,%rsi=temp,%rcx=temp1
movq $2, %rdi            #i=2
movq %rax,%rsi           #temp=n
cqto                     #convert quad word to oct word to avoid floating point exception
idivq %rdi               #n=n/2
addq $1,%rax             #n=n+1
movq %rax,%rcx           #temp1=n
cmpq %rdi, %rax          # Compare n:i
jg .L3                   # if >, jump to loop .L3
movq $0,%rax             #n=0
ret                      #return 0

.L3:                     #loop
                         #%rcx=temp1
movq %rsi,%rax           #n=temp
cqto                     #convert quad word to oct word to avoid floating point exception
idivq %rdi               #n=n/i
imulq %rdi,%rax          #n=n*i
cmpq %rax,%rsi           #temp:n
je .L4                   #if(temp==n),jump to loop .L4
addq $1,%rdi             #i=i+1
cmpq %rdi,%rcx           #temp1:i
jg .L3                   #if(temp1>i),jump toloop .L3
jmp .L5                  #else jump to loop .L5

.L4:                     #loop
movq $1,%rax             #n=1
ret                      #return 1
 
.L5:                     #loop
movq $0,%rax             #n=0
ret                      #return 0

.global	largest_primefact         #making largest_primefact global
largest_primefact:                #%rdi=n,%rax=temp,%r12=temp2,%r11=temp3
movq %rdi,%rax                    #temp=n
movq %rdi,%r12                    #temp2=n
movq %rdi,%r11                    #temp2=n
cmpq $1,%rdi                      #compare N:1
jg .L6                            #if(N>1),jump to loop  .L6
movq $-1,%rax                     #else temp=-1
ret                               #return temp

.L6:                              #loop
call is_prime                     #call to function is_prime,temp=return value
cmpq $1,%rax                      #compare temp:0
je .L7                            #if(temp!=0),jump to loop .L6
movq %r12,%rax                    #else temp=N
ret                               #return temp 

.L7:                              #loop
                                  #i=%rcx,remainder(on idivq)=%rdx
subq $1,%r12                      #temp2=temp2-1
movq %r12,%rcx                    #i=temp2
movq %r11,%rax                    #temp=temp1
cqto                              #convert quad word to oct word to avoid floating point exception
idivq %rcx                        #temp=temp/i
cmpq $0,%rdx                      #compare remainder:0
je .L8                            #if(remainder==0),jump to loop .L8
cmpq $1,%rcx                      #else compare i:1
jg .L7                            #if(i>1),jump to loop  .L7
movq $-1,%rax                     #else temp=-1
ret                               #return temp


.L8:                              #loop
movq %r12,%rax                    #temp=temp1
call is_prime                     #call to is_prime function,temp=return value
cmpq $0,%rax                      #compare temp:0
jne .L9                           #if(temp!=0),jump to loop .L9
movq %r12,%rax                    #else temp=temp1
ret                               #return temp

.L9:                              #loop
cmpq $2,%r12                      #compare temp1:2
jg .L7                            #if(temp1>0),jump to loop .L7
movq $-1,%rax                     #else temp=-1
ret                               #return temp
