program p3265;
const
	maxn = 300;
	maxm = 1000;
	infinity = 1000000000;
type
	node = record
		day,cost:longint;
	end;
	moneynode = record
		s,t:longint;
	end;
var
	f:array[0..maxn,0..maxm] of node;
	a:array[1..maxn] of moneynode;
	k:node;
	i,j,ans,m,n:longint;
function min(a,b:node):node;
 begin
 	if (a.day < b.day) then exit(a);
 	if (a.day > b.day) then exit(b);
 	if (a.cost < b.cost) then exit(a) else exit(b);
 end;
 
begin
	readln(m,n);
	for i:=0 to n do
		for j:=0 to m do begin
			f[i,j].cost:=infinity;
			f[i,j].day:=infinity;
		end;
	for i:=1 to n do readln(a[i].s,a[i].t);
	with f[1,a[1].s] do begin
		day:=2;
		cost:=a[1].t;
	end;
	for i:=1 to n - 1 do
		for j:=0 to m do
			if (f[i,j].cost < infinity) then begin
				k.cost:=a[i + 1].t + f[i,j].cost;
				k.day:=f[i,j].day;
				if (a[i + 1].s + j <= m) and (a[i + 1].t + f[i,j].cost <= m) then f[i + 1,a[i + 1].s + j]:=min(f[i + 1,a[i + 1].s + j],k);
				k.cost:=a[i + 1].t;
				k.day:=f[i,j].day + 1;
				if (a[i + 1].s + f[i,j].cost <= m) then f[i + 1,a[i + 1].s + f[i,j].cost]:=min(f[i + 1,a[i + 1].s + f[i,j].cost],k);
				k.cost:=a[i + 1].t;
				k.day:=f[i,j].day + 2;
				f[i + 1,a[i + 1].s]:=min(f[i + 1,a[i + 1].s],k)
			end;
	ans:=infinity;
	for i:=1 to m do
		if (f[n,i].day + 1 < ans) then ans:=f[n,i].day + 1;
	writeln(ans);
end.