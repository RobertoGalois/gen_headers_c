# gen_headers_c
rudimentary script shell that generate all .h files of a directory

For example, you have this directory
main.c
file1.c
file2.c

you run gen_headers_c.sh in the directory and your directory will look like that
main.c
file1.c
file2.c
file1.h
file2.h

if file1.c is like that
#include    <stdio.h>

int   ft_pouet(int a, char c)
{
      printf("%c", c);
      return (0);
}

struct s_yolo ft_prout(void)
{
       struct s_yolo ret;
       return (ret);
}

Your generated file1.h file will be
<code>
#ifndef FILE1_H
 #define FILE1_H
 int   ft_pouet(int a, char c);
 struct s_yolo ft_prout(void);
#endif
</code>
