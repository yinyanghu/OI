# include <stdio.h>
const int n=4;
int tot = 0;
int path[4];
int used [7][3];
void search (int dep )
{
int i;
printf ("(");
for(i = 0; i < dep ; i ++)
{ if(i) printf (","); printf ("%d" , path [i ]); }
for(i = dep ; i < n; i ++)
{ if(i) printf (","); printf ("?" ); }
printf (")\n");
if(dep == 4) tot ++;
 else for(i = 0; i < 4; i ++)
if (! used [i ][0] && ! used [i-dep+3][1] && ! used [i+dep ][2]){
path [dep ] = i;
used [i ][0] = used [i-dep+3][1] = used [i+dep ][2] = 1;

search (dep + 1);
used [i ][0] = used [i-dep+3][1] = used [i+dep ][2] = 0;

}
}
int main ()
{
search (0);
printf ("%d\n" , tot );
return 0;
}
