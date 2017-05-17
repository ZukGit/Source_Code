#include <stdlib.h>  
#define BOOL int    // C语言 巧妙的使用 宏来解决C语言不支持 BOOL类型的问题   
#define TRUE 1     // C语言 巧妙的使用 宏来解决C语言不支持 TRUE类型的问题   
#define FALSE 0   // C语言 巧妙的使用 宏来解决C语言不支持 FALSE类型的问题   
  
struct array  
{  
    int count;  
    int size;  
    char *pBase;  
};  
void init_arr (struct array *pArr,int number);  
void show_arr (const struct array *pArr);  
BOOL is_empty (const struct array *pArr);  
  
int main (void)  
{  
    struct array arr;  
  
    init_arr (&arr,10);  
    show_arr (&arr);  
  
    return 0;     
}  
void init_arr (struct array *pArr,int number)  
{  
    pArr->pBase = (char *)malloc(sizeof(char)*number);  
    if (NULL == pArr->pBase)  
    {  
        printf ("Memory allocation failed!\a\n");  
        exit(EXIT_FAILURE);  
    }  
    else  
    {  
        pArr->size = number;  
        pArr->count = 0;  
    }  
      
    return;  
}  
void show_arr (const struct array *pArr)  
{  
    int i;  
    if ( is_empty(pArr) )  
        printf ("Array is empty!\a\n");  
    else  
    {  
        for (i=0;i<(pArr->count);i++)  
            printf ("%c ",pArr->pBase[i]);  
        printf ("\n");  
    }  
      
    return;  
}  
BOOL is_empty (const struct array *pArr)  
{  
    if (pArr->count == 0)  
        return TRUE;  
    else  
        return FALSE;  
}  
