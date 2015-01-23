program p3262;
const
	maxn = 100000;
	eps = 0.0000001;
type
	node = record
		t,d:longint;
		key:double;
	end;
var
	a:array[1..maxn] of node;
	sum:array[1..maxn] of int64;
	i,n:longint;
	ans:int64;
	
procedure sort(l,r:longint);
 var
 	i,j:longint;
 	x,y:node;
 begin
 	i:=l; j:=r; x:=a[(l + r) shr 1];
 	repeat
 		while (a[i].key < x.key) do inc(i);
 		while (a[j].key > x.key) do dec(j);
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
		readln(a[i].t,a[i].d);
		a[i].key:=a[i].t / a[i].d;
	end;
	sort(1,n);
	sum[1]:=a[1].d;
	for i:=2 to n do sum[i]:=sum[i - 1] + a[i].d;
	ans:=0;
	for i:=1 to n do ans:=ans + (a[i].t * 2) * (sum[n] - sum[i]);
	writeln(ans);
end.