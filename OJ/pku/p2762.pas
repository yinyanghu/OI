program p2762;
const maxn=1000;
      maxsize=100;
      maxscc=1000;
type vector=record
	 size:longint;
	 w:array[1..maxsize] of longint;
     end;
var order,flag:array[1..maxn] of longint;
    path,inpath:array[1..maxn] of vector;
    rebuild:array[1..maxscc] of vector;
    count:array[1..maxscc] of longint;
    used:array[1..maxscc,1..maxscc] of boolean;
    vis:array[1..maxn] of boolean;
    ordernum,n,totalscc,t:longint;

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
 var i:longint;
 begin
     vis[x]:=true; flag[x]:=totalscc;
     for i:=1 to inpath[x].size do
	if (not vis[inpath[x].w[i]]) then redfs(inpath[x].w[i]);
 end;

procedure findscc;
 var i:longint;
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
 end;

procedure rebuildmap;
 var i,j:longint;
 begin
     for i:=1 to totalscc do begin
         rebuild[i].size:=0;
	 count[i]:=0;
     end;
     fillchar(used,sizeof(used),true);
     for i:=1 to n do
	for j:=1 to path[i].size do
	    if (flag[i]<>flag[path[i].w[j]]) and (used[flag[i],flag[path[i].w[j]]]) then begin
	        inc(rebuild[flag[i]].size);
		rebuild[flag[i]].w[rebuild[flag[i]].size]:=flag[path[i].w[j]];
		inc(count[flag[path[i].w[j]]]);
		used[flag[i],flag[path[i].w[j]]]:=false;
	    end;
 end;

function longestlink:longint;
 var i,max:longint;
 
 procedure longdfs(x,len:longint);
  var i:longint;
  begin
      if len>max then max:=len;
      for i:=1 to rebuild[x].size do longdfs(rebuild[x].w[i],len+1);
  end;

 begin
     max:=-1;
     for i:=1 to totalscc do
	if count[i]=0 then longdfs(i,1);
     longestlink:=max;
 end;

procedure init;
 var i,m,x,y:longint;
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
 end;
 
procedure main;
 begin
     findscc;
     rebuildmap;
     if longestlink=totalscc then writeln('Yes') else writeln('No');
 end;
 
begin
    readln(t);
    while t>0 do begin
        dec(t);
	init;
	main;
    end;
end.
