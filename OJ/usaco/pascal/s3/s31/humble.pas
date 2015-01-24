{
ID:lijianx1
PROG:humble
LANG:PASCAL
}
program humble;
const
	maxn = 100000;
	maxm = 100;
	infinity = 2000000000;
var
	a:array[0..maxn] of longint;
	prime,f:array[1..maxm] of longint;
	i,j,k,min,n:longint;
begin
	assign(input,'humble.in'); reset(input);
	readln(k,n);
	fillchar(f,sizeof(f),0);
	for i:=1 to k do read(prime[i]);
	close(input);
	a[0]:=1;
	for i:=1 to n do begin
		min:=infinity;
		for j:=1 to k do
			if (a[f[j]] * prime[j] < min) then min:=a[f[j]] * prime[j];
		a[i]:=min;
		for j:=1 to k do
			if (a[f[j]] * prime[j] = min) then inc(f[j]);
	end;
	assign(output,'humble.out'); rewrite(output);
	writeln(a[n]);
	close(output);
end.