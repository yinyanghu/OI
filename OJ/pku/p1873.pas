program p1873;
const
	maxn = 15;
	infinity = 100000000;
type
	treenode = record
		x,y,v,l:longint;
	end;
	pointnode = record
		x,y:longint;
	end;
var
	tree:array[1..maxn] of treenode;
	flag,best:array[1..maxn] of boolean;
	point:array[1..maxn] of pointnode;
	stack:array[1..maxn] of longint;
	minvalue,mincut,n,test:longint;
	extra:double;

procedure init;
 var
	i:longint;
 begin
	readln(n);
	inc(test);
	if (n = 0) then halt;
	writeln('Forest ',test);
	for i:=1 to n do readln(tree[i].x,tree[i].y,tree[i].v,tree[i].l);
 end;

procedure swap(var a,b:pointnode);
 var
	k:pointnode;
 begin
	k:=a; a:=b; b:=k;
 end;

function cross(p1,p2,p3:pointnode):longint;
 begin
	cross:=(p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x);
 end;

procedure sort(l,r:longint);
 var
	i,j:longint;
	x:pointnode;
 begin
	i:=l; j:=r; x:=point[(l + r) shr 1];
	repeat
		while (cross(point[1],point[i],x) > 0) do inc(i);
		while (cross(point[1],point[j],x) < 0) do dec(j);
		if (i <= j) then begin
			swap(point[i],point[j]);
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

function getdist(a,b:pointnode):double;
 begin
	getdist:=sqrt(sqr(a.x - b.x) + sqr(a.y - b.y));
 end;

function check:double;
 var
	i,tot,top,k:longint;
 begin
	tot:=0;
	for i:=1 to n do
		if (flag[i]) then begin
			inc(tot);
			point[tot].x:=tree[i].x; point[tot].y:=tree[i].y;
		end;
	if (tot <= 1) then exit(0);
	k:=1;
	for i:=2 to tot do
		if (point[i].x < point[k].x) or ((point[i].x = point[k].x) and (point[i].y < point[k].y)) then k:=i;
	swap(point[1],point[k]);
	sort(2,tot);
	if (tot = 2) then begin
		for i:=1 to 2 do stack[i]:=i;
		top:=2;
	end else begin
		for i:=1 to 3 do stack[i]:=i;
		top:=3;
		for i:=4 to tot do begin
			while (cross(point[stack[top]],point[stack[top-1]],point[i]) > 0) do dec(top);
			inc(top); stack[top]:=i;
		end;
	end;
	check:=0;
	for i:=2 to top do
		check:=check + getdist(point[stack[i]],point[stack[i - 1]]);
        check:=check + getdist(point[stack[1]],point[stack[top]]);
 end;

procedure dfs(depth,cut,value,wood:longint);
 var
	need:double;
 begin
	if (depth = n + 1) then begin
		need:=check;
		if (need <= wood) then begin
			if (value < minvalue) then begin
				minvalue:=value;
				mincut:=cut;
				extra:=wood - need;
				best:=flag;
			end else if (value = minvalue) and (cut < mincut) then begin
				mincut:=cut;
				extra:=wood - need;
				best:=flag;
			end;
		end;
		exit;
	end;
	flag[depth]:=false;
	dfs(depth + 1,cut + 1,value + tree[depth].v,wood + tree[depth].l);
	flag[depth]:=true;
	dfs(depth + 1,cut,value,wood);
 end;

procedure main;
 var
	i:longint;
 begin
	minvalue:=infinity;
	dfs(1,0,0,0);
	write('Cut these trees:');
	for i:=1 to n do
		if (not best[i]) then write(' ',i);
	writeln;
	writeln('Extra wood: ',extra:0:2);
	writeln;
 end;

begin
	test:=0;
	while true do begin
		init;
		main;
	end;
end.
