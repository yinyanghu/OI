program p224;
const
	maxn = 10;
var
	tot,n,k:longint;
	h:array[1..maxn] of boolean;
	f:array[2..maxn * 2] of boolean;
	g:array[-maxn + 1..maxn - 1] of boolean;
	
procedure dfs(x,remain:longint);
 var
 	y:longint;
 begin
 	if (remain = 0) then begin
 		inc(tot);
 		exit;
 	end;
 	if (remain > n - x + 1) then exit;
 	dfs(x + 1,remain);
 	for y:=1 to n do
 		if (not h[y]) and (not f[x + y]) and (not g[x - y]) then begin
 			h[y]:=true; f[x + y]:=true; g[x - y]:=true;
 			dfs(x + 1,remain - 1);
 			h[y]:=false; f[x + y]:=false; g[x - y]:=false;
 		end;
 end;
	
begin
	readln(n,k);
	tot:=0;
	fillchar(h,sizeof(h),0);
	fillchar(f,sizeof(f),0);
	fillchar(g,sizeof(g),0);
	dfs(1,k);
	writeln(tot);
end.
