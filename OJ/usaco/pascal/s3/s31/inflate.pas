{
ID:lijianx1
PROG:inflate
LANG:PASCAL
}
program inflate;
const
	maxn = 10000;
	maxm = 10000;
var
	f:array[0..maxm] of longint;
	v,p:array[1..maxn] of longint;
	i,j,m,n:longint;
	
begin
	assign(input,'inflate.in'); reset(input);
	readln(m,n);
	for i:=1 to n do readln(v[i],p[i]);
	close(input);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=p[i] to m do
			if (f[j - p[i]] + v[i] > f[j]) then f[j]:=f[j - p[i]] + v[i];
	assign(output,'inflate.out'); rewrite(output);
	writeln(f[m]);
	close(output);
end.