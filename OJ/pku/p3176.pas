program p3176;
const maxn=350;
var a,f:array[1..maxn,1..maxn] of longint;
    i,j,ans,n:longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
begin
    readln(n);
    for i:=1 to n do
	for j:=1 to i do read(a[i,j]);
    f[1,1]:=a[1,1];
    for i:=2 to n do begin
        f[i,1]:=f[i-1,1]+a[i,1];
	f[i,i]:=f[i-1,i-1]+a[i,i];
	for j:=2 to i-1 do f[i,j]:=max(f[i-1,j],f[i-1,j-1])+a[i,j];
    end;
    ans:=-1;
    for i:=1 to n do
	if f[n,i]>ans then ans:=f[n,i];
    writeln(ans);
end.
