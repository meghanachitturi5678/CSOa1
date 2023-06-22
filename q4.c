#include <stdio.h>
#include <math.h>
long long largest_primefact(long long n);
long long is_prime(long long n);
int main()
{
    long long N,M=0;
    scanf("%lld", &N);
    M=largest_primefact(N);
    printf("%lld\n", M);
    return 0;
}