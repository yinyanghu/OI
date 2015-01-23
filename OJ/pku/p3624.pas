program p3624;
const
	maxn = 3402;
	maxm = 12880;
var
	w,d:array[1..maxn] of longint;
	f:array[0..maxm] of longint;
	i,j,n,m:longint;
begin
	readln(n,m);
	for i:=1 to n do readln(w[i],d[i]);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=m downto w[i] do
			if (f[j] < f[j - w[i]] + d[i]) then f[j]:=f[j - w[i]] + d[i];
	writeln(f[m]);
end.