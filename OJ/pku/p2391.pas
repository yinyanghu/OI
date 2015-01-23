program p2391;
const
	maxn = 200;
	maxm = 402;
	maxqueue = 1000;
var
	cow,shelter:array[1..maxn] of longint;
	g:array[1..maxn,1..maxn] of int64;
	f:array[1..maxm,1..maxm] of int64;
	level:array[1..maxm] of longint;
	queue:array[1..maxqueue] of longint;
	source,sink,n:longint;
	tot,infinity:int64;
function min(a,b:int64):int64;inline;
 begin
	if (a < b) then min:=a else min:=b;
 end;

procedure init;
 var
	m,i,j,x,y,len:longint;
 begin
	readln(n,m);
	tot:=0;
	for i:=1 to n do begin
		readln(cow[i],shelter[i]);
		tot:=tot + cow[i];
	end;
	infinity:=100000000000000;
	for i:=1 to n do
		for j:=1 to n do g[i,j]:=infinity;
	for i:=1 to m do begin
		readln(x,y,len);
		if (g[x,y] > len) then begin
			g[x,y]:=len; g[y,x]:=len;
		end;
	end;
	source:=1; sink:=2 * n + 2;
 end;

function find:int64;
 var
	i,j,k:longint;
 begin
	for i:=1 to n do g[i,i]:=0;
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				g[i,j]:=min(g[i,j],g[i,k] + g[k,j]);
	find:=-infinity;
	for i:=1 to n do
		for j:=1 to n do
			if (i <> j) and (g[i,j] <> infinity) and (g[i,j] > find) then find:=g[i,j];
 end;

procedure buildmap(limit:int64);
 var
	i,j:longint;
 begin
	fillchar(f,sizeof(f),0);
	for i:=1 to n do begin
		f[source,i + 1]:=cow[i];
		f[i + n + 1,sink]:=shelter[i];
	end;
	for i:=1 to n do
		for j:=1 to n do
			if (g[i,j] <> infinity) and (g[i,j] <= limit) then f[i + 1,j + n + 1]:=infinity;
 end;

function marklevel:boolean;
 var
	head,tail,u,i:longint;
 begin
	fillchar(level,sizeof(level),255);
	head:=0; tail:=1; queue[1]:=source; level[source]:=0;
	while (head < tail) do begin
		inc(head); u:=queue[head];
		for i:=1 to n * 2 + 2 do
			if (f[u,i] > 0) and (level[i] < 0) then begin
				level[i]:=level[u] + 1;
				inc(tail); queue[tail]:=i;
			end;
		if (level[sink] > 0) then exit(true);
	end;
	marklevel:=false;
 end;

function extendflow(u:longint; delta:int64):longint;
 var
	d,flow,i:longint;
 begin
	if (u = sink) then exit(delta);
	flow:=0;
	for i:=1 to n * 2 + 2 do begin
		if (f[u,i] > 0) and (level[i] = level[u] + 1) then begin
			d:=extendflow(i,min(delta,f[u,i]));
			if (d > 0) then begin
				f[u,i]:=f[u,i] - d;
				f[i,u]:=f[i,u] + d;
				delta:=delta - d;
				flow:=flow + d;
			end;
		end;
		if (delta = 0) then break;
	end;
	extendflow:=flow;
 end;

function netflow(limit:int64):boolean;
 var
	delta,flow:longint;
 begin
	buildmap(limit);
	flow:=0;
	while (marklevel) do begin
		delta:=extendflow(source,infinity);
		while (delta > 0) do begin
			flow:=flow + delta;
			if (flow = tot) then exit(true);
			delta:=extendflow(source,infinity);
		end;
	end;
	netflow:=false;
 end;

procedure main;
 var
	left,right,mid:int64;
 begin
	left:=0; right:=find;
	if (not netflow(right)) then begin
		writeln(-1);
		exit;
	end;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if (netflow(mid)) then right:=mid - 1 else left:=mid + 1;
	end;
	writeln(left);
 end;

begin
	init;
	main;
end.
