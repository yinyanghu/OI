program p226;
const
	maxn = 200;
	maxm = 40000;
	maxqueue = 10000;
type
	edgenode = record
		v,next,color:longint;
	end;
	queuenode = record
		x,color:longint;
	end;
var
	edge:array[1..maxm] of edgenode;
	start:array[1..maxn] of longint;
	queue:array[1..maxqueue] of queuenode;
	f:array[1..maxn,1..3] of longint;
	n:longint;
	
procedure init;
 var
 	i,m,x:longint;
 begin
 	readln(n,m);
 	for i:=1 to m do begin
 		read(x,edge[i].v,edge[i].color);
 		edge[i].next:=start[x];
 		start[x]:=i;
 	end;
 end;

procedure main;
 var
 	head,tail,p,i:longint;
 	cur:queuenode;
 begin
 	head:=0; tail:=3;
 	fillchar(f,sizeof(f),255);
 	for i:=1 to 3 do begin
 		f[1,i]:=0;
 		queue[i].x:=1;
 		queue[i].color:=i;
 	end;
 	while (head <> tail) do begin
 		inc(head); if (head > maxqueue) then head:=1;
 		cur:=queue[head];
 		p:=start[cur.x];
 		while (p > 0) do begin
 			if (f[edge[p].v,edge[p].color] = -1) and (cur.color <> edge[p].color) then begin
 				f[edge[p].v,edge[p].color]:=f[cur.x,cur.color] + 1;
 				if (edge[p].v = n) then begin
 					writeln(f[edge[p].v,edge[p].color]);
 					halt;
 				end;
 				inc(tail); if (tail > maxqueue) then tail:=1;
 				queue[tail].x:=edge[p].v;
 				queue[tail].color:=edge[p].color;
 			end;
 			p:=edge[p].next;
 		end;
 	end;
 	writeln(-1);
 end;

begin
	init;
	main;
end.
