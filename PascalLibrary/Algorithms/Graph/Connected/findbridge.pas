program findbridge;
const maxn=100;
      maxsize=10;
type edgenode=record
	 size:longint;
	 w:array[1..maxsize] of longint;
     end;
var a:array[1..maxn] of edgenode;
    flag:array[1..maxn] of boolean;
    entertime,low:array[1..maxn] of longint;
    ans:array[1..maxn,1..2] of longint;
    bridgenum,tot,n:longint;
procedure init;
 var i,m,x,y:longint;
 begin
     for i:=1 to n do a[i].size:=0;
     readln(n,m);
     for i:=1 to m do begin
         readln(x,y);
	 inc(a[x].size); a[x].w[a[x].size]:=y;
	 inc(a[y].size); a[y].w[a[y].size]:=x;
     end;
 end;

procedure dfs(x,father:longint);
 var i:longint;
 begin
     inc(tot);
     flag[x]:=false; entertime[x]:=tot; low[x]:=tot;
     for i:=1 to a[x].size do begin
	 if flag[a[x].w[i]] then begin
	     dfs(a[x].w[i],x);
	     if low[a[x].w[i]]<low[x] then low[x]:=low[a[x].w[i]];
	 end else if (a[x].w[i]<>father) and (entertime[a[x].w[i]]<low[x]) then low[x]:=entertime[a[x].w[i]];
     end;
 end;

procedure bridge;
 var i,j:longint;
 begin
     fillchar(flag,sizeof(flag),true);
     fillchar(entertime,sizeof(entertime),0);
     fillchar(low,sizeof(low),0);
     bridgenum:=0; tot:=0;
     for i:=1 to n do
	if flag[i] then dfs(i,0);
     for i:=1 to n do
	 for j:=1 to a[i].size do
	     if low[a[i].w[j]]>entertime[i] then begin
	         inc(bridgenum);
		 ans[bridgenum,1]:=i; ans[bridgenum,2]:=a[i].w[j];
	     end;
 end;

procedure print;
 var i:longint;
 begin
     writeln(bridgenum);
     for i:=1 to bridgenum do writeln(ans[i,1],' ',ans[i,2]);
 end;

begin
    init;
    bridge;
    print;
end.
