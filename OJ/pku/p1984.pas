program p1984;
const
	maxn = 40000;
	maxm = 40000;
	maxq = 10000;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
type
	edgenode = record
		s,t,len,direction:longint;
	end;
	questionnode = record
		a,b,time,num,ans:longint;
	end;
	treenode = record
		f,x,y:longint;
	end;
var
	edge:array[1..maxm] of edgenode;
	question:array[1..maxq] of questionnode;
	tree:array[0..maxn] of treenode;
	n,m,tot,xx,yy:longint;
procedure sorttime(l,r:longint);
 var
	i,j:longint;
	x,y:questionnode;
 begin
	i:=l; j:=r; x:=question[(l + r) shr 1];
	repeat
		while (question[i].time < x.time) do inc(i);
		while (question[j].time > x.time) do dec(j);
		if (i <= j) then begin
			y:=question[i]; question[i]:=question[j]; question[j]:=y;
			inc(i); dec(j);
		end;
	until i > j;
	if (l < j) then sorttime(l,j);
	if (i < r) then sorttime(i,r);
 end;
 
procedure sortnum(l,r:longint);
 var
	i,j:longint;
	x,y:questionnode;
 begin
	i:=l; j:=r; x:=question[(l + r) shr 1];
	repeat
		while (question[i].num < x.num) do inc(i);
		while (question[j].num > x.num) do dec(j);
		if (i <= j) then begin
			y:=question[i]; question[i]:=question[j]; question[j]:=y;
			inc(i); dec(j);
		end;
	until i > j;
	if (l < j) then sortnum(l,j);
	if (i < r) then sortnum(i,r);
 end;
 
procedure init;
 var
	i:longint;
	ch:char;
 begin
	readln(n,m);
	for i:=1 to m do begin
		read(edge[i].s,edge[i].t,edge[i].len);
		read(ch); read(ch); readln;
		case ch of
			'N':edge[i].direction:=1;
			'S':edge[i].direction:=2;
			'E':edge[i].direction:=3;
			'W':edge[i].direction:=4;
		end;
	end;
	for i:=1 to n do begin
		tree[i].f:=-1;
		tree[i].x:=0; tree[i].y:=0;
	end;
	readln(tot);
	for i:=1 to tot do begin
		readln(question[i].a,question[i].b,question[i].time);
		question[i].num:=i;
	end;
	sorttime(1,tot);
 end;
 
function root(k:longint):longint;
 begin
	if (tree[k].f = -1) then begin
		xx:=0; yy:=0;
		exit(k);
	end;
	tree[k].f:=root(tree[k].f);
	tree[k].x:=tree[k].x + xx;
	tree[k].y:=tree[k].y + yy;
	xx:=tree[k].x;
	yy:=tree[k].y;
	exit(tree[k].f);
 end;
 
procedure main;
 var
	i,j,x,y:longint;
 begin
 	j:=1;
	for i:=1 to m do begin
		x:=root(edge[i].s);
		y:=root(edge[i].t);
		tree[y].f:=x;
		tree[y].x:=-dx[edge[i].direction] * edge[i].len - tree[edge[i].t].x + tree[edge[i].s].x;
		tree[y].y:=-dy[edge[i].direction] * edge[i].len - tree[edge[i].t].y + tree[edge[i].s].y;
		while (j <= tot) and (question[j].time = i) do begin
			x:=root(question[j].a);
			y:=root(question[j].b);
			if (x <> y) then question[j].ans:=-1
				else question[j].ans:=abs(tree[question[j].a].x - tree[question[j].b].x) + abs(tree[question[j].a].y - tree[question[j].b].y);
			inc(j);
		end;
	end;
	sortnum(1,tot);
	for i:=1 to tot do writeln(question[i].ans);
 end;
 
 
begin
	init;
	main;
end.