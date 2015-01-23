program p3045;
const
	maxn = 50000;
	infinity = 1000000000;
type
	node = record
		w,s,key:longint;
	end;
var
	a:array[1..maxn] of node;
	i,k,ans,n:longint;

procedure sort(l,r:longint);
 var
	i,j,x:longint;
	y:node;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1].key;
	repeat
		while (a[i].key < x) do inc(i);
		while (a[j].key > x) do dec(j);
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
	for i:=1 to n do begin
		readln(a[i].w,a[i].s);
		a[i].key:=a[i].w + a[i].s;
	end;
	sort(1,n);
	ans:=-infinity;
	k:=0;
	for i:=1 to n do begin
		k:=k + a[i].w;
		if (k - a[i].key > ans) then ans:=k - a[i].key;
	end;
	writeln(ans);
end.
