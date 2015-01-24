program connect;
const
	maxedge = 1000;
	maxn = 100;
type
	edgenode = record
		v,next:longint;
	end;
var
	start:array[1..maxn] of longint;
	edge:array[1..maxedge] of edgenode;
	bridge:array[1..maxn,1..2] of longint;
	cut:array[1..maxn] of longint;
	entertime,low,child:array[1..maxn] of longint;
	flag,root:array[1..maxn] of boolean;
	edgenum,n,tot,bridgenum,pointnum:longint;
	
procedure insert(x,y:longint);
 begin
	inc(edgenum);
	with edge[edgenum] do begin
		v:=y;
		next:=start[x];
	end;
	start[x]:=edgenum;
	inc(edgenum);
	with edge[edgenum] do begin
		v:=x;
		next:=start[y];
	end;
	start[y]:=edgenum;
 end;
	
procedure init;
 var
	i,m,x,y:longint;
 begin
	readln(n,m);
	edgenum:=0;
	for i:=1 to m do begin
		readln(x,y);
		insert(x,y);
	end;
 end;
 
procedure dfs(x,father:longint);
 var
	p:longint;
 begin
	inc(tot);
	flag[x]:=false; entertime[x]:=tot; low[x]:=tot;
	p:=start[x];
	while (p > 0) do begin
		if (flag[edge[p].v]) then begin
			inc(child[x]);
			dfs(edge[p].v,x);
			if (low[edge[p].v] < low[x]) then low[x]:=low[edge[p].v];
		end else if (edge[p].v <> father) and (entertime[edge[p].v] < low[x]) then low[x]:=entertime[edge[p].v];
		p:=edge[p].next;
	end;
 end;
 
procedure connect;
 var
	i,p:longint;
 begin
	fillchar(flag,sizeof(flag),true);
	fillchar(entertime,sizeof(entertime),0);
	fillchar(child,sizeof(child),0);
	fillchar(low,sizeof(low),0);
	fillchar(root,sizeof(root),false);
	bridgenum:=0; pointnum:=0;
	tot:=0;
	for i:=1 to n do
		if (flag[i]) then begin
			root[i]:=true;
			dfs(i,0);
		end;
	//cut point
	for i:=1 to n do 
		if (root[i]) and (child[i] >= 2) then begin
			inc(pointnum);
			cut[pointnum]:=i;
		end else if (not root[i]) then begin
			p:=start[i];
			while (p > 0) do begin
				if (low[edge[p].v] >= entertime[i]) then begin
					inc(pointnum);
					cut[pointnum]:=i;
					break;
				end;
				p:=edge[p].next;
			end;
		end;
	//bridge
	for i:=1 to n do begin
		p:=start[i];
		while (p > 0) do begin
			if (low[edge[p].v] > entertime[i]) then begin
				inc(bridgenum);
				bridge[bridgenum,1]:=i; bridge[bridgenum,2]:=edge[p].v;
			end;
			p:=edge[p].next;
		end;
	end;
 end;
 
procedure print;
 var
	i:longint;
 begin
	writeln('Bridge ---->');
	writeln('Number = ',bridgenum);
	for i:=1 to bridgenum do writeln(bridge[i,1],' ',bridge[i,2]);
	writeln('Cut Point ---->');
	writeln('Number = ',pointnum);
	for i:=1 to pointnum do writeln(cut[i]);
 end;
 
begin
	init;
	connect;
	print;
end.
