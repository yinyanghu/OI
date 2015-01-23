program p2231;
const
	maxn = 10000;
var
	a:array[1..maxn] of longint;
	i,n:longint;
	sum:int64;
procedure sort(l,r:longint);
 var
	i,j,x,y:longint;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i] < x) do inc(i);
		while (a[j] > x) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n);
	for i:=1 to n do readln(a[i]);
	sort(1,n);
	sum:=0;
	for i:=1 to n do sum:=sum + a[i] * (2 * int64(i) - 1 - n);
	sum:=sum shl 1;
	writeln(sum);
end.