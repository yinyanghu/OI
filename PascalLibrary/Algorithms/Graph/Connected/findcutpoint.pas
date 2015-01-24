program findcutpoint;
const maxn=100;
      maxsize=10;
type edgenode=record
	 size:longint;
	 w:array[1..maxsize] of longint;
     end;
var a:array[1..maxn] of edgenode;
    flag,root:array[1..maxn] of boolean;
    entertime,low,child:array[1..maxn] of longint;
    ans:array[1..maxn] of longint;
    pointnum,tot,n:longint;
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
	     inc(child[x]);
	     dfs(a[x].w[i],x);
	     if low[a[x].w[i]]<low[x] then low[x]:=low[a[x].w[i]];
	 end else if (a[x].w[i]<>father) and (entertime[a[x].w[i]]<low[x]) then low[x]:=entertime[a[x].w[i]];
     end;
 end;

procedure cutpoint;
 var i,j:longint;
 begin
     fillchar(flag,sizeof(flag),true);
     fillchar(root,sizeof(root),false);
     fillchar(entertime,sizeof(entertime),0);
     fillchar(child,sizeof(child),0);
     fillchar(low,sizeof(low),0);
     pointnum:=0; tot:=0;
     for i:=1 to n do
	if flag[i] then begin
	    root[i]:=true;
	    dfs(i,0);
	end;
     for i:=1 to n do
         if (root[i]) and (child[i]>=2) then begin
	     inc(pointnum);
	     ans[pointnum]:=i;
	 end else if not root[i] then begin
	     for j:=1 to a[i].size do
	         if low[a[i].w[j]]>=entertime[i] then begin
	             inc(pointnum);
	 	     ans[pointnum]:=i;
		     break;
	         end;
	 end;
 end;

procedure print;
 var i:longint;
 begin
     writeln(pointnum);
     for i:=1 to pointnum do writeln(ans[i]);
 end;

begin
    init;
    cutpoint;
    print;
end.
