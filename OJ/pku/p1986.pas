{$M 2000000,0,20000000}
program p1986;
const
	maxn = 40000;
	maxq = 10000;
	root = 1;
type
	pointer = ^node;
	node = record
		p:longint;
		next:pointer;
	end;
	pointnode = record
		x,y,len:longint;
	end;
	questionnode = record
		x,y:longint;
	end;
	setnode = record
		f,rank:longint;
	end;
var
	a:array[1..maxn] of pointnode;
	link,qlink:array[1..maxn] of pointer;
	question:array[1..maxq] of questionnode;
	tree:array[1..maxn] of setnode;
	flag:array[1..maxn] of boolean;
	anc:array[1..maxn] of longint;
	dist:array[1..maxn] of longint;
	ans:array[1..maxn] of longint;
	n,tot:longint;

procedure init;
 var
 	i,m:longint;
 	w:pointer;
 begin
	readln(n,m);
	for i:=1 to n do new(link[i]);
	for i:=1 to m do begin
		read(a[i].x,a[i].y,a[i].len); readln;
		new(w); w^.next:=link[a[i].x]^.next; w^.p:=i;
		link[a[i].x]^.next:=w;
		new(w); w^.next:=link[a[i].y]^.next; w^.p:=i;
		link[a[i].y]^.next:=w;
	end;
	readln(tot);
	for i:=1 to n do new(qlink[i]);
	for i:=1 to tot do begin
		readln(question[i].x,question[i].y);
		new(w); w^.next:=qlink[question[i].x]^.next; w^.p:=i;
		qlink[question[i].x]^.next:=w;
		new(w); w^.next:=qlink[question[i].y]^.next; w^.p:=i;
		qlink[question[i].y]^.next:=w;		
	end;
 end;

function getroot(x:longint):longint;
 var
	k:longint;
 begin
	k:=x;
	while (tree[k].f <> k) do k:=tree[k].f;
	while (x <> k) do begin
		tree[x].f:=k;
		x:=tree[x].f;
	end;
	getroot:=k;
 end;

function union(x,y:longint):boolean;
 var
	p,q:longint;
 begin
	p:=getroot(x); q:=getroot(y);
	if (p = q) then exit(false);
	if (tree[p].rank = tree[q].rank) then begin
		tree[q].f:=p;
		inc(tree[p].rank);
		exit(true);
	end;
	if (tree[p].rank > tree[q].rank) then tree[q].f:=p else tree[p].f:=q;
	exit(true);
 end;

procedure lca(x,d:longint);
 var
        y:longint;
        w:pointer;
 begin
	tree[x].f:=x;
	anc[getroot(x)]:=x;
	dist[x]:=d;
	w:=link[x];
	while (w^.next <> nil) do begin
		w:=w^.next;
		if (a[w^.p].x = x) then y:=a[w^.p].y else y:=a[w^.p].x;
		if (tree[y].f <> -1) then continue;
		lca(y,d + a[w^.p].len);
		union(x,y);
		anc[getroot(x)]:=x;
	end;
	flag[x]:=false;
	w:=qlink[x];
	while (w^.next <> nil) do begin
		w:=w^.next;
		if (question[w^.p].x = x) then y:=question[w^.p].y else y:=question[w^.p].x;
		if (not flag[y]) then ans[w^.p]:=anc[getroot(y)];
	end;
 end;

procedure main;
 var
	i:longint;
 begin
	for i:=1 to n do begin
		tree[i].f:=-1;
		tree[i].rank:=0;
		flag[i]:=true;
	end;
	lca(root,0);
	for i:=1 to tot do writeln(dist[question[i].x] + dist[question[i].y] - dist[ans[i]] * 2);
 end;

begin
	init;
	main;
end.
