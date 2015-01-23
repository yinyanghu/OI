program p3668;
const maxn=200;
      infinity=100000000;
      eps=0.0000001;
var n,i,j,k,total,ans,dx,dy:longint;
    x,y:array[1..maxn] of longint;
    slope:array[1..maxn*maxn] of double;
procedure sort(l,r:longint);
 var i,j:longint;
     x,y:double;
 begin
     i:=l; j:=r; x:=slope[(l+r) shr 1];
     repeat
        while slope[i]<x do inc(i);
	while slope[j]>x do dec(j);
	if i<=j then begin
	    y:=slope[i]; slope[i]:=slope[j]; slope[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
begin
    readln(n);
    for i:=1 to n do readln(x[i],y[i]);
    total:=0;
    for i:=1 to n-1 do
	for j:=i+1 to n do begin
	    inc(total);
	    dx:=x[j]-x[i]; dy:=y[j]-y[i];
	    if dx=0 then slope[total]:=infinity
		else slope[total]:=dy/dx;
	end;
    sort(1,total);
    k:=0; ans:=0;
    while k<total do begin
        inc(k); inc(ans);
	while (k<total) and (abs(slope[k]-slope[k+1])<eps) do inc(k);
    end;
    writeln(ans);
end.
