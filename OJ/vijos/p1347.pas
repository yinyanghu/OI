program p1347;
const maxn=40;
      maxk=6;
var a:array[1..maxn,1..maxn] of qword;
    f:array[0..maxk,1..maxn] of qword;
    i,j,n,m,k:longint;
    s:string;
begin
    readln(n,m);
    readln(s);
    for i:=1 to n do
	for j:=i to n do val(copy(s,i,j-i+1),a[i,j]);
    fillchar(f,sizeof(f),0);
    for i:=1 to n do f[0,i]:=a[1,i];
    for i:=1 to m do
	for j:=i+1 to n do
	    for k:=i to j-1 do
		if f[i,j]<f[i-1,k]*a[k+1,j] then f[i,j]:=f[i-1,k]*a[k+1,j];
    writeln(f[m,n]);
end.
