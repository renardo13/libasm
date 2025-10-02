#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* To have access to the ASM library */
extern long ft_strlen(const char *s);
extern char* ft_strcpy(const char *dest, const char*src);
extern int ft_strcmp(const char *s1, const char*s2);
extern ssize_t ft_write(int fd, const void *msg, size_t len);

int main()
{
    char *s = "hello";

    printf("return of strlen = %ld\n", ft_strlen(s));

    /* ----------------------------------------------------------------- */
    
    char dest[1024];
    
    printf("return of strcpy = %s\n", ft_strcpy(dest, s));


    /* ----------------------------------------------------------------- */

    char *s2 = "Salut ca va ?";
    // char *d3 = "coucou";

    if(ft_strcmp(s, s2) == 0)
        printf("The two strings are the same\n");
    else
        printf("The two strings are differents\n");
        printf("return of strcmp = %d\n", ft_strcmp(s, s2));
        
        
    /* ----------------------------------------------------------------- */

    // ssize_t ret;

    // ret = ft_write(12, s2, ft_strlen(s2));

    // printf("\nretour de write %zd\n", ret);

    // if (ret == -1) {
    //     // errno contient le code d'erreur positif
    //     printf("Write failed! errno = %d (%s)\n", errno, strerror(errno));
    // } else {
    //     printf("Write succeeded, wrote %zd bytes\n", ret);
    // }


}
