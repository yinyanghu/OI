#include <fstream.h>
#include <iostream.h>
#include <string.h>
#include <stdlib.h>

ifstream fin("pair.in");
ofstream fout("pair.out");

const int MAX = 200000+5;

int n, m, a[100+5], b[10+5], c[MAX];

int cmp(const void* e1, const void* e2) {
   return *(const int*)e1 - *(const int*)e2;  
}

main() {
   int i, j, k, min, now;

   fin >> n;
   m = n * (n - 1) / 2;
   for (i = 0; i < m; i++)
      fin >> a[i];
   qsort(a, m, sizeof(int), cmp);
   min = a[0];
   
   memset(c, 0, sizeof(c));   
   for (i = 0; i <= min / 2; i++) {
      for (j = 0; j < m; c[a[j++]] = 0);
      for (j = 1; j < m; c[a[j++]]++);
      b[0] = i, b[1] = a[0] - i;
      
      for (now = 1, j = 2; j < n; j++) {
         while (now < m && !c[a[now]]) now++;
         if (now == m) break;
         
         b[j] = a[now] - b[0];
         
         for (k = 0; k < j; k++)
            if (c[b[k] + b[j]])
               c[b[k] + b[j]]--;
            else
               break;
         if (k < j) break;
      }      
      if (j < n) continue;
      
      for (j = 1; j < n; j++)
         if (b[j] < 0 || b[j] < b[j - 1])
            break;
      if (j < n) continue;
      
      break;
   }
   
   if (i > min / 2)
      fout << "Impossible" << endl;
   else {
      for (i = 0; i < n; i++) {
         if (i) fout << ' ';  
         fout << b[i];
      }
      cout << endl;
   }
   
   return 0;   
}
