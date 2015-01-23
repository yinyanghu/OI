program p2394;
const
	maxn = 500;
	maxm = 100;
	infinity = 100000000000;
var
	a:array[1..maxn,1..maxn] of longint;
	f:array[1..maxn] of int64;
	flag:array[1..maxn] of boolean;
	cow:array[1..maxm] of longint;
	n,m,c:longint;
procedure init;
 var
 	i,p,x,y,k:longint;
 begin
	fillchar(a,sizeof(a),$7F);
	readln(n,p,c,m);
	for i:=1 to p do begin
		readln(x,y,k);
		if (a[x,y] > k) then begin
			a[x,y]:=k;
			a[y,x]:=k;
		end;
	end;
 end;

procedure dijkstra;
 var
 	i,k:longint;
        min:int64;
 begin
 	for i:=1 to n do begin
 		flag[i]:=true;
 		f[i]:=infinity;
 	end;
 	f[1]:=0;
 	repeat
 		min:=infinity;
 		for i:=1 to n do
 			if (flag[i]) and (f[i] < min) then begin
 				k:=i; min:=f[i];
 			end;
 		if (min = infinity) then exit;
 		flag[k]:=false;
 		for i:=1 to n do
 			if (flag[i]) and (f[k] + a[k,i] < f[i]) then f[i]:=f[k] + a[k,i];
 	until false;
 end;

procedure main;
 var
 	i,k,tot:longint;
 begin
 	dijkstra;
 	tot:=0;
 	for i:=1 to c do begin
 		readln(k);
 		if (f[k] <= m) then begin
 			inc(tot);
 			cow[tot]:=i;
 		end;
 	end;
 	writeln(tot);
 	for i:=1 to tot do writeln(cow[i]);
 end;

begin
	init;
	main;
end.
