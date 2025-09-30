#include <stdio.h>

/* To have access to the ASM library */
extern long ft_strlen(const char *s);

int main()
{
    char *s = "Hello";

    printf("return of strlen = %ld\n", ft_strlen(s));
}