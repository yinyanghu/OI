program lis;
const
	maxn = 100000;
	infinity = 100000000;
var
	f,a:array[1..maxn] of longint;
	n,size,i:longint;
function find(x:longint):longint;
 var
	left,right,mid:longint;
 begin
	left:=0; right:=size;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if (x > f[mid]) and (x <= f[mid + 1]) then exit(mid);
		if (x > f[mid]) then left:=mid + 1 else right:=mid - 1;
	end;
 end;
 
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	fillchar(f,sizeof(f),0);
	size:=0;
	f[size]:=-infinity;
	for i:=1 to n do
		if (a[i] > f[size]) then begin
			inc(size);
			f[size]:=a[i];
		end else f[find(a[i]) + 1]:=a[i];
	writeln(size);
end.
{
//Increase
	max:=-1;
	for i:=1 to n do begin
		f[i]:=1;
		for j:=1 to i - 1 do
			if (a[i] > a[j]) and (f[i] < f[j] + 1) then f[i]:=f[j] + 1; // a[i] >= a[j] --->Not Decrease
		if (f[i] > max) then f[i]:=max;
	end;
	writeln(max);
}

{
//Decrease
	max:=-1;
	for i:=n downto 1 do begin
		f[i]:=1;
		for j:=i + 1 to n do
			if (a[i] > a[j]) and (f[i] < f[j] + 1) then f[i]:=f[j] + 1; // a[i] >= a[j] --->Not Increase
		if (f[i] > max) then f[i]:=max;
	end;
	writeln(max);
}