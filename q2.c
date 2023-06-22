#include <stdio.h>
long long gcd_calc(long long M, long long N);
int main()
{
    long long N, M, x = 0;
    scanf("%lld%lld", &N, &M);
    x = gcd_calc(M, N);
    printf("%lld\n", x);
    return 0;
}