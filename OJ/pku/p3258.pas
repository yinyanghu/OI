program p3258;
const
	maxn = 50000;
var
	a:array[1..maxn] of longint;
	left,right,mid,i,n,m,l:longint;
	
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
 
function check(w:longint):boolean;
 var
 	tot,last,i:longint;
 begin
 	last:=0; tot:=0;
 	for i:=1 to n do
 		if (a[i] - last <= w) then inc(tot) else last:=a[i];
 	check:=(tot <= m);
 end;
 
begin
	readln(l,n,m);
	for i:=1 to n do readln(a[i]);
	if (n = 0) then begin
		writeln(l);
		halt;
	end;
	sort(1,n);
	left:=0; right:=l;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if check(mid) then left:=mid + 1 else right:=mid - 1;
	end;
	writeln(left);
end.