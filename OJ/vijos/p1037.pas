program p1037;
var f:array[0..100,0..2000] of longint;
    a:array[1..100] of longint;
    i,j,m,n:longint;
begin
    readln(n); m:=0;
    for i:=1 to n do begin
	read(a[i]);
	m:=m+a[i];
    end;
    filldword(f,sizeof(f) div 4,maxlongint+1);
    f[0,0]:=0;
    for i:=1 to n do
	for j:=0 to m do begin
            if f[i,j]<f[i-1,j] then f[i,j]:=f[i-1,j];
            if f[i,j]<f[i-1,j+a[i]] then f[i,j]:=f[i-1,j+a[i]];
            if (j-a[i]>=0) and (f[i,j]<f[i-1,j-a[i]]+a[i]) then f[i,j]:=f[i-1,j-a[i]]+a[i];
            if (j-a[i]<0) and (f[i,j]<f[i-1,a[i]-j]+j) then f[i,j]:=f[i-1,a[i]-j]+j;
	end;
    if f[n,0]=0 then writeln('Impossible') else writeln(f[n,0]);
end.