#ifndef LIBASM_H
#define LIBASM_H

#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>


long ft_strlen(const char *s);
char* ft_strcpy(const char *dest, const char*src);
int ft_strcmp(const char *s1, const char*s2);
ssize_t ft_write(int fd, const void *msg, size_t len);
ssize_t	ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

#endif