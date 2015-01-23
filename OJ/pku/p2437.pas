program p2437;
const
	maxn = 10000;
type
	node = record
		s,t:longint;
	end;
var
	a:array[1..maxn] of node;
	i,n,l,k,cur,ans:longint;
	
procedure sort(l,r:longint);
 var
 	i,j:longint;
 	x,y:node;
 begin
 	i:=l; j:=r; x:=a[(l + r) shr 1];
 	repeat
 		while (a[i].s < x.s) do inc(i);
 		while (a[j].s > x.s) do dec(j);
 		if (i <= j) then begin
 			y:=a[i]; a[i]:=a[j]; a[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n,l);
	for i:=1 to n do readln(a[i].s,a[i].t);
	sort(1,n);
	cur:=0; ans:=0;
	for i:=1 to n do begin
		if (a[i].s > cur) then cur:=a[i].s;
		k:=(a[i].t - cur + l - 1) div l;
		ans:=ans + k;
		cur:=cur + k * l;
	end;
	writeln(ans);
end.
