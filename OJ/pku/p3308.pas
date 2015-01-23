program p3308;
const
	limitsize = 102;
	maxqueue = 10000;
	infinity = 100000000;
var
	f:array[1..limitsize,1..limitsize] of double;
	queue:array[1..maxqueue] of longint;
	level:array[1..limitsize] of longint;
	t,i:longint;
	source,sink:longint;
	
procedure init;
 var
 	i,m,n,l,x,y:longint;
 	k:double;
 begin
	fillchar(f,sizeof(f),0);
	readln(m,n,l);
	source:=1; sink:=n + m + 2;
	for i:=1 to m do begin
		read(k);
		f[source,i + 1]:=ln(k);
	end;
	for i:=1 to n do begin
		read(k);
		f[m + i + 1,sink]:=ln(k);
	end;
	for i:=1 to l do begin
		readln(x,y);
		f[x + 1,m + y + 1]:=infinity;
	end;
 end;
 
function marklevel:boolean;
 var
 	u,i,head,tail:longint;
 begin
 	fillchar(level,sizeof(level),255);
 	head:=0; tail:=1; queue[1]:=source; level[source]:=0;
 	while (head <> tail) do begin
 		inc(head); if (head > maxqueue) then head:=1;
 		u:=queue[head];
 		for i:=source to sink do
 			if (f[u,i] > 0) and (level[i] < 0) then begin
 				level[i]:=level[u] + 1;
 				inc(tail); queue[tail]:=i;
 			end;
 		if (level[sink] > 0) then exit(true);
 	end;
 	marklevel:=false;
 end;
 
function min(a,b:double):double;
 begin
 	if (a < b) then min:=a else min:=b;
 end;
 
function extendflow(u:longint; delta:double):double;
 var
 	i:longint;
 	k,flow:double;
 begin
 	if (u = sink) then exit(delta);
 	flow:=0;
 	for i:=source to sink do begin
 		if (f[u,i] > 0) and (level[i] = level[u] + 1) then begin
 			k:=extendflow(i,min(delta,f[u,i]));
 			if (k > 0) then begin
 				f[u,i]:=f[u,i] - k;
 				f[i,u]:=f[i,u] + k;
 				delta:=delta - k;
 				flow:=flow + k;
 			end;
 		end;
 		if (delta = 0) then break;
 	end;
 	extendflow:=flow;
 end;
 
procedure netflow;
 var
 	flow,delta:double;
 begin
 	flow:=0;
 	while (marklevel) do begin
 		delta:=extendflow(source,infinity);
 		while (delta > 0) do begin
 			flow:=flow + delta;
 			delta:=extendflow(source,infinity);
 		end;
 	end;
 	writeln(exp(flow):0:4);
 end;
 
begin
	readln(t);
	for i:=1 to t do begin
		init;
		netflow;
	end;
end.