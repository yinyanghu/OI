program p3172;
const
	maxn = 1000;
var
	n,i,c:longint;
	ans:int64;
	a:array[1..maxn] of longint;
	sum:array[1..maxn] of int64;
procedure dfs(k:longint; weight:int64);
 begin
	if (weight > c) then exit;
	if (weight > ans) then ans:=weight;
	if (k = 0) or (weight + sum[k] <= ans) then exit;
	dfs(k - 1,weight + a[k]);
	dfs(k - 1,weight);
 end;
 
begin
	readln(n,c);
	for i:=1 to n do readln(a[i]);
	sum[1]:=a[1];
	for i:=2 to n do sum[i]:=sum[i - 1] + a[i];
	ans:=-1;
	dfs(n,0);
	writeln(ans);
end.
