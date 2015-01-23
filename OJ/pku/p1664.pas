program p1664;
const maxn=10;
var f:array[0..maxn,0..maxn] of longint;
    t,i,n,m,k,total:longint;
procedure work(n,k:longint);
 var i,j:longint;
 begin
     f[0,0]:=1;
     for i:=1 to n do
	for j:=1 to i do f[i,j]:=f[i-1,j-1]+f[i-j,j];
 end;
 
begin
    work(maxn,maxn);
    readln(t);
    for i:=1 to t do begin
	readln(m,n);
	total:=0;
	for k:=1 to n do total:=total+f[m,k];
	writeln(total);	
    end;
end.