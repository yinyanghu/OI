program p3663;
const maxn=20000;
var s,n,i,j,total:longint;
    a:array[1..maxn] of longint;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1];
     repeat
	while a[i]<x do inc(i);
	while a[j]>x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
begin
    readln(n,s);
    for i:=1 to n do readln(a[i]);
    sort(1,n);
    total:=0;
    for i:=1 to n-1 do begin
	for j:=i+1 to n do
	    if a[i]+a[j]<=s then inc(total) else break;
    end;
    writeln(total);
end.
