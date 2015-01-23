program p2455;
const
	maxn = 200;
	maxp = 40000;
	infinity = 10000000;
type
	node = record
		x,y,len:longint;
	end;
var
	f:array[1..maxn,1..maxn] of longint;
	level:array[1..maxn] of longint;
	queue:array[1..maxn * 10] of longint;
	path:array[1..maxp] of node;
	source,sink,n,m,t:longint;

procedure sort(l,r:longint);
 var
	i,j,x:longint;
	y:node;
 begin
	i:=l; j:=r; x:=path[(l + r) shr 1].len;
	repeat
		while (path[i].len < x) do inc(i);
		while (path[j].len > x) do dec(j);
		if (i <= j) then begin
			y:=path[i]; path[i]:=path[j]; path[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
	
procedure init;
 var
	i:longint;
 begin
	readln(n,m,t);
	for i:=1 to m do readln(path[i].x,path[i].y,path[i].len);
	sort(1,m);
 end;
 
procedure buildmap(limit:longint);
 var
	i:longint;
 begin
	fillchar(f,sizeof(f),0);
	source:=1; sink:=n;
	for i:=1 to m do
		if (path[i].len <= limit) then begin
			inc(f[path[i].x,path[i].y]);
			inc(f[path[i].y,path[i].x]);
		end else break;
 end;
 
function marklevel:boolean;
 var
	head,tail,v,i:longint;
 begin
	fillchar(level,sizeof(level),255);
	head:=0; tail:=1; queue[1]:=source; level[source]:=0;
	while (head < tail) do begin
		inc(head); v:=queue[head];
		for i:=1 to n do
			if (f[v,i] > 0) and (level[i] < 0) then begin
				level[i]:=level[v] + 1;
				inc(tail); queue[tail]:=i;
			end;
		if (level[sink] > 0) then exit(true);
	end;
	marklevel:=false;
 end;
 
function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;
 
function extendflow(x,delta:longint):longint;
 var
	k,flow,i:longint;
 begin
	if (x = sink) then exit(delta);
	flow:=0;
	for i:=1 to n do begin
		if (f[x,i] > 0) and (level[i] = level[x] + 1) then begin
			k:=extendflow(i,min(delta,f[x,i]));
			if (k > 0) then begin
				f[x,i]:=f[x,i] - k;
				f[i,x]:=f[i,x] + k;
				delta:=delta - k;
				flow:=flow + k;
			end;
		end;
		if (delta = 0) then break;
	end;
	extendflow:=flow;
 end;
 
function netflow:boolean;
 var
	flow,delta:longint;
 begin
	flow:=0;
	while (marklevel) do begin
		delta:=extendflow(source,infinity);
		while (delta > 0) do begin
			flow:=flow + delta;
			if (flow >= t) then exit(true);
			delta:=extendflow(source,infinity);
		end;
	end;
	netflow:=false;
 end;
 
function check(limit:longint):boolean;
 begin
	buildmap(limit);
	check:=netflow;
 end;
 
procedure main;
 var
	left,right,mid,i:longint;
 begin
	left:=path[1].len; right:=path[m].len;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if check(mid) then right:=mid - 1 else left:=mid + 1;
	end;
	writeln(left);
	
 end;
 
begin
	init;
	main;
end.
