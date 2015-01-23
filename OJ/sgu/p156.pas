{
	Method: Euler Path
	Clarity:
		先理解这个图: 它是由若干个子完全图组成, 子完全图中的每个点有且只有一条链与其他的某个点(本子图或其他子图)相连.
		求其hamilton圈,可以先把每个子完全图压缩成一个点(称为团),在这样压缩后的新图上做euler圈,最后再把团展开(入团点->出团点),就是hamliton圈了.
		因为只有团才能为奇点,所以当只有0或1个奇团时问题才有解.

		我程序中Edge为前向星的原边,GrpEdge为团指出去的边(前向星).这样比较方便处理.
	Complexity: O(M)
}
program p156;
const
	maxn = 10000;
	maxm = 100000;
type
	edgenode = record
		v,next,inv:longint;
		flag:boolean;
	end;
	groupedgenode = record
		from,v,next:longint;
	end;
var
	edge:array[1..maxm * 2] of edgenode;
	groupedge:array[1..maxm] of groupedgenode;
	group:array[1..maxn] of longint;
	degree:array[1..maxn] of longint;
	start,groupstart:array[1..maxn] of longint;
	edgenum,groupnum,groupedgenum,n:longint;
	
procedure insert(x,y:longint);
 begin
 	inc(edgenum);
 	edge[edgenum].v:=y;
 	edge[edgenum].flag:=true;
 	edge[edgenum].next:=start[x];
 	edge[edgenum].inv:=edgenum + 1;
 	start[x]:=edgenum;
 	
 	inc(edgenum);
 	edge[edgenum].v:=x;
 	edge[edgenum].flag:=true;
 	edge[edgenum].next:=start[y];
 	edge[edgenum].inv:=edgenum - 1;
 	start[y]:=edgenum;
 end;

procedure inital;
 begin
  	edgenum:=0;
   	groupnum:=0;
 	groupedgenum:=0;
  	fillchar(degree,sizeof(degree),0);
  	fillchar(start,sizeof(start),0);
  	fillchar(group,sizeof(group),0);
 	fillchar(groupstart,sizeof(groupstart),0);
 end;

procedure init;
 var
 	i,x,y,m:longint;
 begin
 	readln(n,m);

 	for i:=1 to m do begin
 		read(x,y);
 		inc(degree[x]);
 		inc(degree[y]);
 		insert(x,y);
 	end;
 end;

procedure findpath(x:longint);
 var
 	p:longint;
 begin
 	if (degree[x] = 2) then begin
 		p:=start[x];
 		while (p > 0) do begin
 			if edge[p].flag then begin
 				edge[p].flag:=false;
 				edge[edge[p].inv].flag:=false;
 				findpath(edge[p].v);
 				write(edge[p].v,' ');
 			end;
 			p:=edge[p].next;
 		end;
 	end else begin
 		p:=groupstart[group[x]];
 		while (p > 0) do begin
 			if edge[groupedge[p].v].flag then begin
 				edge[groupedge[p].v].flag:=false;
 				edge[edge[groupedge[p].v].inv].flag:=false;
 				findpath(edge[groupedge[p].v].v);
 				write(edge[groupedge[p].v].v,' ',groupedge[p].from,' ');
 			end;
 			p:=groupedge[p].next;
 		end;
 	end;
 end;

procedure main;
 var
 	oddpoint,count:longint;
 	i,p:longint;
 	newgroup:boolean;
 begin
 	oddpoint:=0;
 	for i:=1 to n do
 		if (degree[i] > 2) then begin
 			count:=1;
 			newgroup:=(group[i] = 0);
 			if newgroup then begin
 				inc(groupnum);
 				group[i]:=groupnum;
 			end;
 			p:=start[i];
 			while (p > 0) do begin
 				if (degree[edge[p].v] = 2) then begin
 					inc(groupedgenum);
 					groupedge[groupedgenum].from:=i;
 					groupedge[groupedgenum].v:=p;
 					groupedge[groupedgenum].next:=groupstart[group[i]];
 					groupstart[group[i]]:=groupedgenum;
 				end else if (newgroup) then begin
 					group[edge[p].v]:=groupnum;
 					inc(count);
 				end;
 				p:=edge[p].next;
 			end;
 			if (newgroup) and (odd(count)) then
 				if (oddpoint = 0) then oddpoint:=i
 					else begin
 						writeln(-1);
 						halt;
 					end;
 		end;
 	if (oddpoint = 0) then oddpoint:=1;
 	findpath(oddpoint);
 	writeln;
 end;

begin
	init;
	main;
end.
