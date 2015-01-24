program energy;
var i,j,k,p,n,max:longint;
    f:array[0..500,0..500] of longint;
    a:array[0..1000] of longint;

begin
    readln(n);
    for i:=1 to n do begin
        read(a[i]);
        a[i+n]:=a[i];
    end;
    a[0]:=a[n];
    fillchar(f,sizeof(f),0);
    for p:=1 to n do
       for i:=1 to 2*n-p do begin
           j:=i+p;
           max:=0;
           for k:=i to j-1 do
             if f[i,k]+f[k+1,j]+a[i-1]*a[j]*a[k]>max then
                 max:=f[i,k]+f[k+1,j]+a[i-1]*a[j]*a[k];
           f[i,j]:=max;
       end;
    max:=0;
    for i:=1 to n do
      if f[i,i+n-1]>max then max:=f[i,i+n-1];
    writeln(max);
end.