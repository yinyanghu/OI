program p3273;
const
	maxn = 100000;
	infinity = 1000000000;
var
	a:array[1..maxn] of longint;
	n,m,left,right,mid,i:longint;
	
function check(limit:longint):boolean;
 var
	tot,i,sum:longint;
 begin
	tot:=1; sum:=0;
	for i:=1 to n do
		if (sum + a[i] <= limit) then begin
			sum:=sum + a[i]
		end else begin
			inc(tot);
			sum:=a[i];
		end;
	check:=(tot <= m);
 end;
 
begin
	readln(n,m);
	for i:=1 to n do readln(a[i]);
	left:=-infinity; right:=0;
	for i:=1 to n do begin
		if (a[i] > left) then left:=a[i];
		right:=right + a[i];
	end;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if check(mid) then right:=mid - 1 else left:=mid + 1;
	end;
	writeln(left);
end.