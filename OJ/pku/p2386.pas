program p2386;
const maxn=100;
      dx:array[1..8] of longint=(-1,0,1,1,1,0,-1,-1);
      dy:array[1..8] of longint=(1,1,1,0,-1,-1,-1,0);
var n,m,i,j,total:longint;
    a:array[1..maxn,1..maxn] of boolean;
    ch:char;
procedure dfs(x,y:longint);
 var i:longint;
 begin
     a[x,y]:=false;
     for i:=1 to 8 do
	if (x+dx[i]>=1) and (x+dx[i]<=n) and (y+dy[i]>=1) and (y+dy[i]<=m) and (a[x+dx[i],y+dy[i]]) then dfs(x+dx[i],y+dy[i]);
 end;

begin
    readln(n,m);
    for i:=1 to n do begin
        for j:=1 to m do begin
	    read(ch);
	    a[i,j]:=ch='W';
	end;
	readln;
    end;
    total:=0;
    for i:=1 to n do
	for j:=1 to m do
	    if a[i,j] then begin
	        inc(total);
	        dfs(i,j);
	    end;
    writeln(total);
end.
