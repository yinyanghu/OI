(*
opt[i][j] 表示前i 个供应站，供应了j个点。
opt[i][j] = min(opt[i-1][l] + Dis[l+1][j]) 前i-1个 站供应了l个点
剩下l+1到j的点由第i个站去供应。 Dis[i][j]表示第i个点到第j个点的距离。
*)
program p1196;
const
	maxn=200;
	maxk=30;
var
	a:array[1..maxn] of longint;
	dist:array[1..maxn,1..maxn] of longint;
	f:array[1..maxk,1..maxn] of longint;
	n,s,l,r,i,j,k,mid,tot:longint;
function min(a,b:longint):longint;
 begin
	if a < b then min:=a else min:=b;
 end;

begin
	readln(n,s); tot:=0;
	while (n <> 0) and (s <> 0) do begin
		inc(tot);
		for i:=1 to n do readln(a[i]);
		fillchar(dist,sizeof(dist),0);
		for l:=1 to n - 1 do
			for r:=l + 1 to n do begin
				mid:=(l + r) shr 1;
				for i:=l to r do dist[l,r]:=dist[l,r] + abs(a[mid] - a[i]);
			end;
		fillchar(f,sizeof(f),$7F);
		for i:=1 to n do f[1,i]:=dist[1,i];
		for i:=2 to s do
			for j:=1 to n do
				for k:=i - 1 to j - 1 do f[i,j]:=min(f[i,j],f[i - 1,k] + dist[k + 1,j]);
		writeln('Chain ',tot);
		writeln('Total distance sum = ',f[s,n]);
		writeln;
		readln(n,s);
	end;
end.
