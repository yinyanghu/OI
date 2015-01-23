program p1946;
const maxn=21;
      maxe=100;
      maxd=100;
var n,e,d,i,j,k,min,x:longint;
    f:array[1..maxn,0..maxd,0..maxe] of longint;
begin
    readln(n,e,d);
    for i:=1 to n do
        for j:=0 to d do 
        	   for k:=0 to e do f[i,j,k]:=maxlongint;
    f[1,0,0]:=0;
    for i:=1 to n do
    	for j:=0 to d do
             for k:=0 to e do
             	if f[i,j,k]<>maxlongint then begin
                     x:=1;
                     while k+x*x<=e do begin	
                     	if f[i,j+x,k+x*x]>f[i,j,k]+1 then f[i,j+x,k+x*x]:=f[i,j,k]+1;
                         inc(x);
                     end;
                     if f[i+1,j,j]>f[i,j,k] then f[i+1,j,j]:=f[i,j,k];
                 end;
    min:=maxlongint;
    for i:=0 to e do
        if min>f[n,d,i] then min:=f[n,d,i];
    if min<>maxlongint then writeln(min) else writeln(0);
end.