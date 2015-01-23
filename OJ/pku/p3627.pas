program p3627;
const
	maxn = 20000;
var
	a:array[1..maxn] of longint;
	i,n,b,k,sum:longint;
procedure sort(l,r:longint);
 var
	i,j,x,y:longint;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i] > x) do inc(i);
		while (a[j] < x) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n,b);
	for i:=1 to n do readln(a[i]);
	sort(1,n);
	k:=0; sum:=0;
	while (sum < b) do begin
		inc(k);
		sum:=sum + a[k];
	end;
	writeln(k);
end.