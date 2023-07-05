#include <stdio.h>
#include <string.h>


int main(){
	char str_a[20];
	char *pointer1;
	char *pointer2;

	strcpy(str_a, "Hello Worls!\n");
	pointer1 = str_a;
	printf(pointer1);

	pointer2 = pointer1 + 2;
	printf(pointer2);
	strcpy(pointer2, "y you guyrs!\n");
	printf(pointer1);
}
