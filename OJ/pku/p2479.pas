program p2479;
const
	maxn = 50000;
	infinity = 1000000000;
var
	a:array[1..maxn] of longint;
	f,g:array[0..maxn + 1] of longint;
	t,n:longint;
	
procedure init;
 var
 	i:longint;
 begin
 	readln(n);
 	for i:=1 to n do read(a[i]);
 end;

function max(a,b:longint):longint;
 begin
	if (a > b) then max:=a else max:=b;
 end;

procedure main;
 var
 	i,ans,k:longint;
 begin
 	k:=0; f[0]:=-infinity;
 	for i:=1 to n do begin
 		k:=max(a[i],k + a[i]);
 		f[i]:=max(f[i - 1],k);
 	end;
 	k:=0; g[n + 1]:=-infinity;
 	for i:=n downto 1 do begin
 		k:=max(a[i],k + a[i]);
 		g[i]:=max(g[i + 1],k);
 	end;
 	ans:=-infinity;
 	for i:=1 to n - 1 do
 		if (f[i] + g[i + 1] > ans) then ans:=f[i] + g[i + 1];
 	writeln(ans);
 end;

begin
	readln(t);
	for t:=1 to t do begin
		init;
		main;
	end;
end.