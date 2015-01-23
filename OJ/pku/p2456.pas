program p2456;
const
	maxn = 100000;
var
	a:array[1..maxn] of longint;
	n,c,left,right,mid,i:longint;
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
 
function check(x:longint):boolean;
 var
	k,p,tot:longint;
 begin
	tot:=1; k:=1;
	while (tot < c) do begin
		p:=k;
		while (p < n) and (a[p] - a[k] < x) do inc(p);
		if (a[p] - a[k] >= x) then begin
			k:=p;
			inc(tot);
		end else exit(false);
	end;
	check:=true;
 end;
 
begin
	readln(n,c);
	for i:=1 to n do readln(a[i]);
	sort(1,n);
	left:=0; right:=a[n] - a[1];
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if check(mid) then left:=mid + 1 else right:=mid - 1;
	end;
	writeln(left - 1);
end.