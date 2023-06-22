#include <stdio.h>
#include <limits.h>
long long sum_squares(long long N);
int main()
{
    long long N, M = 0;
    scanf("%lld", &N);
    M = sum_squares(N);
    printf("%lld\n", M);
    return 0;
}