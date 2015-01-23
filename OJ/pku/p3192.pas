program p3192;
const
	maxn = 7;
	infinity = 1000000000;
var
	a:array[1..maxn] of string;
	flag:array[1..maxn] of boolean;
	i,n,ans:longint;
function combine(a,b:string):string;
 var
	p,l:longint;
	s:string;
 begin
	if (a = '') then exit(b);
	p:=length(a);
	for l:=length(b) downto 1 do begin
		s:=copy(a,p - l + 1,l);
		if (s = copy(b,1,l)) then exit(copy(a,1,p - l) + b);
	end;
	combine:=a + b;
 end;

procedure dfs(k:longint; s:string);
 var
	i:longint;
 begin
	if (k = n + 1) then begin
		if (length(s) < ans) then ans:=length(s);
		exit;
	end;
	for i:=1 to n do
		if (flag[i]) then begin
			flag[i]:=false;
			dfs(k + 1,combine(s,a[i]));
			flag[i]:=true;
		end;

 end;

begin
	readln(n);
	for i:=1 to n do readln(a[i]);
	fillchar(flag,sizeof(flag),true);
	ans:=infinity;
	dfs(1,'');
	writeln(ans);
end.