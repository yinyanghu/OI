program p2186;
const maxn=10000;
      maxsize=20;
type vector=record
	 size:longint;
	 w:array[1..maxsize] of longint;
     end;
var order,flag,scc,outdegre:array[1..maxn] of longint;
    path,inpath:array[1..maxn] of vector;
    vis:array[1..maxn] of boolean;
    ordernum,n,m,totalscc,x,y,i:longint;
   
procedure dfs(x:longint);
 var i:longint;
 begin
     vis[x]:=true;
     for i:=1 to path[x].size do
	if (not vis[path[x].w[i]]) then dfs(path[x].w[i]);
     inc(ordernum);
     order[ordernum]:=x;
 end;
 
   
procedure redfs(x:longint);
 begin
     vis[x]:=true; flag[x]:=totalscc;
     for i:=1 to inpath[x].size do
	if (not vis[inpath[x].w[i]]) then redfs(inpath[x].w[i]);
 end;
   
procedure kosaraju;
 var i,j,ans,zerodegre:longint;
 begin
     fillchar(vis,sizeof(vis),false);
     for i:=1 to n do
	if (not vis[i]) then dfs(i);
     fillchar(vis,sizeof(vis),false);
     totalscc:=0;
     for i:=ordernum downto 1 do
	if (not vis[order[i]]) then begin
	    inc(totalscc);
	    redfs(order[i]);
	end;
     fillchar(scc,sizeof(scc),0);
     for i:=1 to n do inc(scc[flag[i]]);
     fillchar(outdegre,sizeof(outdegre),0);
     for i:=1 to n do
	for j:=1 to path[i].size do
	   if flag[i]<>flag[path[i].w[j]] then inc(outdegre[flag[i]]);
     ans:=0; zerodegre:=0;
     for i:=1 to totalscc do
	if outdegre[i]=0 then begin
	    inc(zerodegre);
	    ans:=i;
	end;
     if zerodegre>1 then writeln(0) else writeln(scc[ans]);
 end; 
   
begin
    readln(n,m);
    for i:=1 to n do begin
	path[i].size:=0; inpath[i].size:=0;
    end;
    ordernum:=0;
    for i:=1 to m do begin
        readln(x,y);
	inc(path[x].size); path[x].w[path[x].size]:=y;
	inc(inpath[y].size); inpath[y].w[inpath[y].size]:=x;
    end;
    kosaraju;
end.
