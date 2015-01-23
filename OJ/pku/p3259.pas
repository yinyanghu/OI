program p3259;
const
	maxedge = 6000;
	maxn = 500;
type
	edgenode = record
		s,t,dist:longint;
	end;
var
	edge:array[1..maxedge] of edgenode;
	f:array[1..maxn] of longint;
	i,farm,n,w,m,k,edgenum:longint;
	flag:boolean;
	
function min(a,b:longint):longint;
 begin
 	if (a < b) then min:=a else min:=b;
 end;
 
begin
	readln(farm);
	while (farm > 0) do begin
		dec(farm);
		readln(n,m,w);
		edgenum:=0;
		for i:=1 to m do begin
			inc(edgenum);
			readln(edge[edgenum].s,edge[edgenum].t,edge[edgenum].dist);
			inc(edgenum);
			edge[edgenum].s:=edge[edgenum - 1].t;
			edge[edgenum].t:=edge[edgenum - 1].s;
			edge[edgenum].dist:=edge[edgenum - 1].dist;
		end;
		for i:=1 to w do begin
			inc(edgenum);
			readln(edge[edgenum].s,edge[edgenum].t,edge[edgenum].dist);
			edge[edgenum].dist:=-edge[edgenum].dist;
		end;
		fillchar(f,sizeof(f),0);
		for k:=1 to n + 1 do
			for i:=1 to edgenum do
				f[edge[i].t]:=min(f[edge[i].t],f[edge[i].s] + edge[i].dist);
		flag:=false;
		for i:=1 to edgenum do
			if (f[edge[i].t] > f[edge[i].s] + edge[i].dist) then begin
				flag:=true;
				break;
			end;
		if flag then writeln('YES') else writeln('NO');
	end;
end.