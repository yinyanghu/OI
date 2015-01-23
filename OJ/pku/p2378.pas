program p2378;
const
	maxn = 10000;
	limitsize = 20;
	infinity = 100000000;
	root = 1;
type
	node = record 
		size:longint;
		list:array[1..limitsize] of longint;
	end;
var
	a:array[1..maxn] of node;
	f,tot:array[1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	i,n,x,y,min:longint;
procedure dp(x:longint);
 var
 	i:longint;
 begin
	flag[x]:=false;
	f[x]:=0; tot[x]:=1;
	for i:=1 to a[x].size do
		if (flag[a[x].list[i]]) then begin
			dp(a[x].list[i]);
			tot[x]:=tot[x] + tot[a[x].list[i]];
			if (f[x] < tot[a[x].list[i]]) then f[x]:=tot[a[x].list[i]];
		end;
	if f[x] < (n - tot[x]) then f[x]:=n - tot[x];
 end;
 
begin
	readln(n);
	for i:=1 to n do a[i].size:=0;
	for i:=1 to n - 1 do begin
		readln(x,y);
		inc(a[x].size); a[x].list[a[x].size]:=y;
		inc(a[y].size); a[y].list[a[y].size]:=x;
	end;
	fillchar(flag,sizeof(flag),true);
	dp(root);
	min:=infinity;
	for i:=1 to n do
		if (f[i] <= n shr 1) and (f[i] < min) then min:=f[i];
	if min = infinity then writeln('NONE') else begin
		for i:=1 to n do
			if f[i] = min then writeln(i);
	end;
end.