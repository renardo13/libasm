#include "includes/libasm.h"

int main()
{
    /* -------------------------------STRLEN---------------------------------- */

    char *s = "coucou ca va ? :)";

    printf("return of strlen = %ld\n", ft_strlen(s));

    /* -------------------------------STRCPY---------------------------------- */
    
    char dest[1024];
    
    printf("return of strcpy = %s\n", ft_strcpy(dest, s));


    /* -----------------------------STRCMP------------------------------------ */

    char *s2 = "Salut ca va ?";
    // char *d3 = "coucou";

    if(ft_strcmp(s, s2) == 0)
        printf("The two strings are the same\n");
    else
        printf("The two strings are differents\n");
    printf("return of strcmp = %d\n", ft_strcmp(s, s2));
        
        
    /* --------------------------WRITE--------------------------------------- */

    ssize_t ret;

    ret = ft_write(1, s2, ft_strlen(s2));

    printf("\nretour de write %zd\n", ret);

    if (ret == -1) {
        // errno contient le code d'erreur positif
        printf("Write failed! errno = %d (%s)\n", errno, strerror(errno));
    } else {
        printf("Write succeeded, wrote %zd bytes\n", ret);
    }

    /* -------------------------READ---------------------------------------- */

    char buf[1024];

    ret = ft_read(0, &buf, 1024);

    printf("\nretour de read %zd\n", ret);

    if (ret == -1) {
        // errno contient le code d'erreur positif
        printf("Read failed! errno = %d (%s)\n", errno, strerror(errno));
    } else {
        printf("Read succeeded, wrote %zd bytes\n", ret);
    }

    /* ----------------------------------------------------------------- */

    printf("retour de strdup = %s\n", ft_strdup(s));
    
}
