program p3620;
const maxn=100;
      maxm=100;
var n,m,k,max,i,j,x,y:longint;
    a:array[1..maxn,1..maxm] of longint;
function dfs(x,y:longint):longint;
 begin
     dfs:=1; a[x,y]:=2;
     if (x+1<=n) and (a[x+1,y]=1) then dfs:=dfs+dfs(x+1,y);
     if (x-1>=1) and (a[x-1,y]=1) then dfs:=dfs+dfs(x-1,y);
     if (y+1<=m) and (a[x,y+1]=1) then dfs:=dfs+dfs(x,y+1);
     if (y-1>=1) and (a[x,y-1]=1) then dfs:=dfs+dfs(x,y-1);
 end;
 
begin
    readln(n,m,k);
    fillchar(a,sizeof(a),255);
    for i:=1 to n do
	for j:=1 to m do a[i,j]:=0;
    for i:=1 to k do begin
        readln(x,y);
	a[x,y]:=1;
    end;
    max:=-1;
    for i:=1 to n do
	for j:=1 to m do
	    if a[i,j]=1 then begin
	        k:=dfs(i,j);
		if k>max then max:=k;
	    end;
    writeln(max);
end.
