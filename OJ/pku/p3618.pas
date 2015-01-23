program p3618;
const maxn=50000;
var t,n,i,k,total,last:longint;
    a:array[1..maxn] of longint;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=abs(a[(l+r) shr 1]);
     repeat
	while abs(a[i])<abs(x) do inc(i);
	while abs(a[j])>abs(x) do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
begin
    readln(t,n);
    for i:=1 to n do readln(a[i]);
    sort(1,n);
    total:=0; k:=0; last:=0;
    while total<=t do begin
        inc(k);
	total:=total+abs(a[k]-last);
	last:=a[k];
    end;
    writeln(k-1);
end.
