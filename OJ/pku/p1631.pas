program p1631;
const
	maxn = 40000;
	infinity = 10000000;
var
	a:array[1..maxn] of longint;
	f:array[0..maxn] of longint;
	n,p,size,i:longint;
	
procedure init;
 var
	i:longint;
 begin
 	fillchar(f,sizeof(f),0);
 	readln(p);
 	for i:=1 to p do readln(a[i]);
 end;
 
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
 
procedure main;
 var
 	i:longint;
 begin
 	f[0]:=-infinity;
 	size:=0;
 	for i:=1 to p do
 		if (a[i] > f[size]) then begin
 			inc(size);
 			f[size]:=a[i];
 		end else f[find(a[i]) + 1]:=a[i];
 	writeln(size);
 end;
 
begin
	readln(n);
	for i:=1 to n do begin
		init;
		main;
	end;
end.
