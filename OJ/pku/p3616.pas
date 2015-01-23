program p3616;
const maxn=1000;
type node=record
	 left,right,key:longint;
     end;
var f:array[1..maxn] of longint;
    a:array[1..maxn] of node;
    i,j,n,m,r,ans:longint;
procedure sort(l,r:longint);
 var i,j:longint;
     x,y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1];
     repeat
	while (a[i].left<x.left) do inc(i);
	while (a[j].left>x.left) do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
begin
    readln(m,n,r);
    for i:=1 to n do readln(a[i].left,a[i].right,a[i].key);
    sort(1,n);
    for i:=1 to n do f[i]:=a[i].key;
    ans:=-1;
    for i:=2 to n do begin
	for j:=1 to i do
	    if (a[j].right+r<=a[i].left) then f[i]:=max(f[i],f[j]+a[i].key);
	ans:=max(ans,f[i]);
    end;
    writeln(ans);
end.
