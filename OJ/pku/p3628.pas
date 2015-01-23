program p3628;
const
	maxn = 20;
var
	a:array[1..maxn] of longint;
	n,b,ans,i:longint;
	
procedure dfs(k,sum:longint);
 begin
 	if (sum >= b) and (sum < ans) then ans:=sum;
	if (k = n + 1) or (sum >= ans) then exit;
	dfs(k + 1,sum + a[k]);
	dfs(k + 1,sum);
 end;
 
begin
	readln(n,b);
	for i:=1 to n do readln(a[i]);
	ans:=maxlongint;
	dfs(1,0);
	writeln(ans - b);
end.