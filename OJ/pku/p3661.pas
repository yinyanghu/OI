program p3661;
const maxn=10000;
      maxm=500;
var f:array[0..maxn,0..maxm] of longint;
    a:array[1..maxn] of longint;
    n,m,i,j:longint;
begin
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do readln(a[i]);
    fillchar(f,sizeof(f),0);
    for i:=0 to n do
	for j:=0 to m do begin
	    if (i+1<=n) and (j+1<=m) and (i>=j) and (f[i,j]+a[i+1]>f[i+1,j+1]) then f[i+1,j+1]:=f[i,j]+a[i+1];
	    if (i+j<=n) and (f[i,j]>f[i+j,0]) then f[i+j,0]:=f[i,j];
            if (j=0) and (i+1<=n) and (f[i,j]>f[i+1,0]) then f[i+1,0]:=f[i,j];
        end;
    writeln(f[n,0]);
end.
