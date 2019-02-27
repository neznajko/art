#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int key[] = { 'f','f','g','a',
		  'c','b','a','c',
		  'b','a','a','b',
		  'd','e','a','a', };
    int u = 'a';
    int v = 'g';
    int *sort;
    int zkeys = sizeof key / sizeof (int);
    int *count;
    int zcount = v - u + 1;
    int j;

    // initialize
    count = calloc(zcount, sizeof (int));
    sort = malloc(zkeys * sizeof (int));
    // fill counters
    for (j = 0; j < zkeys; j++)
	count[key[j] - u]++;
    // accumulate
    for (j = 1; j < zcount; j++)
	count[j] += count[j - 1];
    // position
    for (j = 0; j < zkeys; j++) 
	sort[--count[key[j] - u]] = key[j];
    // print
    for (j = 0; j < zkeys; j++)
	printf("%2d %c %c\n", j + 1, key[j], sort[j]);
    // finalize
    free(count);
    free(sort);

    return 0;
}
