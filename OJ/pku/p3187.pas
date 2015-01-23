program p3187;
const
	maxn = 10;
var
	a:array[1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	f:array[1..maxn,1..maxn] of longint;
	n,w:longint;

procedure print;
 var
	i:longint;
 begin
	for i:=1 to n - 1 do write(a[i],' ');
	writeln(a[n]);
	halt;
 end;

function check:boolean;
 var
	i,j:longint;
 begin
	for i:=1 to n do f[n,i]:=a[i];
	for i:=n - 1 downto 1 do
		for j:=1 to i do f[i,j]:=f[i + 1,j] + f[i + 1,j + 1];
	check:=(f[1,1] = w);
 end;

procedure dfs(k:longint);
 var
	i:longint;
 begin
	if (k = n + 1) then begin
		if check then print;
		exit;
	end;
	for i:=1 to n do
		if (flag[i]) then begin
			a[k]:=i;
			flag[i]:=false;
			dfs(k + 1);
			flag[i]:=true;
		end;
 end;

begin
	readln(n,w);
	fillchar(flag,sizeof(flag),true);
	dfs(1);
end.