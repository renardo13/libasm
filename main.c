#include <stdio.h>

/* To have access to the ASM library */
extern long ft_strlen(const char *s);
extern char* ft_strcpy(const char *dest, const char*src);
extern int ft_strcmp(const char *s1, const char*s2);

int main()
{
    char *s = "ertretrethello";

    printf("return of strlen = %ld\n", ft_strlen(s));
    
    char dest[6];
    
    printf("return of strcpy = %s\n", ft_strcpy(dest, s));

    char *s2 = "dethello";
    // char *d3 = "coucou";

    if(ft_strcmp(s, s2) == 0)
        printf("The two strings are the same\n");
    else
        printf("The two strings are differents\n");

    printf("return of strlen = %d\n", ft_strcmp(s, s2));


}
