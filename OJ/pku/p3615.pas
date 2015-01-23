program p3615;
const maxn=300;
      infinity=1000000000;
var n,m,t,i,j,k,x,y:longint;
    f:array[1..maxn,1..maxn] of longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
begin
    readln(n,m,t);
    for i:=1 to n do
	for j:=1 to n do
	    if i=j then f[i,j]:=0 else f[i,j]:=infinity;
    for i:=1 to m do begin
        readln(x,y,k);
	f[x,y]:=k;
    end;
    for k:=1 to n do
	for i:=1 to n do
	    for j:=1 to n do
	        if max(f[i,k],f[k,j])<f[i,j] then f[i,j]:=max(f[i,k],f[k,j]);
    for i:=1 to t do begin
        readln(x,y);
	if f[x,y]=infinity then writeln(-1) else writeln(f[x,y]);
    end;
end.
