program p3186;
const
	maxn = 2000;
var
	a:array[0..maxn] of longint;
	f:array[0..maxn] of longint;
	i,j,n:longint;

function max(a,b:longint):longint;
 begin
	if (a > b) then max:=a else max:=b;
 end;

begin
	readln(n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do begin
		readln(a[i]);
		f[i]:=a[i] * n;
	end;
	for j:=2 to n do
		for i:=1 to n - j + 1 do
			f[i]:=max(f[i + 1] + a[i] * (n - j + 1),f[i] + a[i + j - 1] * (n - j + 1));
	writeln(f[1]);
end.