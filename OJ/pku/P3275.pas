program p3275;
const
	maxn = 1000;
	limitsize = 100;
type
	node = record
		size:longint;
		list:array[1..limitsize] of longint;
	end;
var
	flag:array[1..maxn,1..maxn] of boolean;
	visit:array[1..maxn] of boolean;
	a:array[1..maxn] of node;
	x,y,i,j,m,n,ans:longint;
procedure dfs(s,t:longint);
 var
	i:longint;
 begin
	flag[s,t]:=true;
	visit[t]:=true;
	for i:=1 to a[t].size do
		if (not visit[a[t].list[i]]) then dfs(s,a[t].list[i]);
 end;
 
begin
	readln(n,m);
	for i:=1 to n do a[i].size:=0;
	fillchar(flag,sizeof(flag),false);
	for i:=1 to m do begin
		readln(x,y);
		inc(a[x].size); a[x].list[a[x].size]:=y;
		flag[x,y]:=true;
	end;
	fillchar(visit,sizeof(visit),false);
	for i:=1 to n do begin
		fillchar(visit,sizeof(visit),false);
		dfs(i,i);
	end;
	ans:=0;
	for i:=1 to n do
		for j:=i + 1 to n do
			if (flag[i,j] = false) and (flag[j,i] = false) then inc(ans);
	writeln(ans);
end.