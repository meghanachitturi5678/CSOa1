#include <stdio.h>
long long quotient_calc(long long M, long long N);
long long remainder_calc(long long M, long long N, long long quotient);
int main()
{
    long long M, N;
    scanf("%lld%lld", &M, &N);
    long long q = 0, r = 0;
    q = quotient_calc(M, N);
    r = remainder_calc(M, N, q);
    printf("%lld %lld\n", q, r);
    return 0;
}