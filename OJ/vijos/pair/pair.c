#include <stdio.h>

int i,j,k,n,N,tot;

int s[100], aplus[10], x[10], news[100];

comp(int *a, int *b) {
   return *a - *b;
}

main(){
   while (1 == scanf("%d",&n)) {
      N = n*(n-1)/2;
      for (tot=i=0;i<N;i++) {
         scanf("%d",&s[i]);
         tot += s[i];
      }
      tot /= (n-1);
      qsort(s,N,sizeof(int),comp);
      aplus[1] = s[0];
      aplus[2] = s[1];
      if(!try(3,2)) printf("Impossible\n");
   }
}

try(int ai, int si){
   int i,j,k;
   if (ai == n) {
      k = 0;
      for (i=1;i<n;i++) k += aplus[i];
      x[0] = (k-tot)/(n-2);
      for (i=1;i<n;i++) x[i] = aplus[i] - x[0];
      for (i=0;i<n;i++) for (j=i+1;j<n;j++) {
         k = x[i]+x[j];
         if (!bsearch(&k,s,N,sizeof(int),comp)) return 0;
      }
      for (i=k=0;i<n;i++) for (j=i+1;j<n;j++) news[k++] = x[i]+x[j];
      qsort(news,N,sizeof(int),comp);
      for (i=0;i<N;i++) if (news[i] != s[i]) return 0;
     
      for (i=0;i<n;i++) printf("%d%c",x[i],i<n-1?' ':'\n');
      return 1;
   }
   if (si+n-ai > N-2) return 0;
   for (i=si;i<N-2;i++) {
      aplus[ai] = s[i];
      if (try(ai+1, i+1)) return 1;
   }
   return 0;
}
