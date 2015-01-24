program dinic;
const
	maxn = 1000;
	maxedge = 1000;
	maxqueue = 10000;
	infinity = 100000000;
type
	edgenode = record
		v,key,next,inv:longint;
	end;
var
	queue:array[1..maxqueue] of longint;
	level:array[1..maxn] of longint;
	edge:array[1..maxedge] of edgenode;
	start:array[1..maxn] of longint;
	use:array[1..maxn] of longint;
	source,sink,edgenum:longint;
	
procedure insert(x,y,key:longint);
 begin
	inc(edgenum);
	edge[edgenum].v:=y; edge[edgenum].key:=key;
	edge[edgenum].inv:=edgenum + 1;
	edge[edgenum].next:=start[x];
	start[x]:=edgenum;
	
	inc(edgenum);
	edge[edgenum].v:=x; edge[edgenum].key:=0;
	edge[edgenum].inv:=edgenum - 1;
	edge[edgenum].next:=start[y];
	start[y]:=edgenum;
 end;
	
procedure initialize;
 begin
	fillchar(start,sizeof(start),0);
	fillchar(edge,sizeof(edge),0);
	fillchar(use,sizeof(use),0);
	edgenum:=0;
 end;
	
procedure init;
 var
	n:longint;
 begin
	source:=1; sink:=n;
	initialize;
 end;

function marklevel:boolean;
 var
	head,tail,x,p:longint;
 begin
	fillchar(level,sizeof(level),255);
	head:=0; tail:=1; queue[1]:=sink; level[sink]:=0; use[sink]:=start[sink];
	while (head <> tail) do begin
		inc(head); if (head > maxqueue) then head:=1;
		x:=queue[head];
		p:=start[x];
		while (p > 0) do begin
			if (edge[edge[p].inv].key > 0) and (level[edge[p].v] < 0) then begin
				level[edge[p].v]:=level[x] + 1;
				use[edge[p].v]:=start[edge[p].v];
				inc(tail); if (tail > maxqueue) then tail:=1;
				queue[tail]:=edge[p].v;		
			end;
			if (level[source] >= 0) then exit(true);
			p:=edge[p].next;
		end;
	end;
	marklevel:=false;
 end;
 
 
function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;
 
function extendflow(x,delta:longint):longint;
 var
	k,p:longint;
 begin
	if (x = sink) then exit(delta);
	p:=use[x];
	while (p > 0) do begin
		if (edge[p].key > 0) and (level[edge[p].v] + 1 = level[x]) then begin
			k:=extendflow(edge[p].v,min(delta,edge[p].key));
			if (k > 0) then begin
				edge[p].key:=edge[p].key - k;
				edge[edge[p].inv].key:=edge[edge[p].inv].key + k;
				exit(k);
			end;
		end;
		p:=edge[p].next;
	end;
	extendflow:=0;
 end;
 
function netflow:longint;
 var
	delta:longint;
 begin
	netflow:=0;
	while (marklevel) do begin
		delta:=extendflow(source,infinity);
		while (delta > 0) do begin
			netflow:=netflow + delta;
			delta:=extendflow(source,infinity);
		end;
	end;
 end; 

 
begin
	init;
	netflow;
end.
