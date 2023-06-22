#include <stdio.h>
int is_prime(int n);
int main()
{
    long long N;
    int x = 0;
    scanf("%lld", &N);
    x = is_prime(N);
    if (x == 0)
    {
        printf("TRUE\n");
    }
    else 
        printf("FALSE\n");
    return 0;
}