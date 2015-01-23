program p2228;
const
	maxn = 3830;
var
	a:array[1..maxn] of longint;
	f,g:array[boolean,0..maxn - 1,boolean] of longint;
	n,b,i,j,ans:longint;
	flag:boolean;
	
function max(a,b:longint):longint;inline;
 begin
	if (a > b) then max:=a else max:=b;
 end;
 
function min(a,b:longint):longint;inline;
 begin
 	if (a < b) then min:=a else min:=b;
 end;
 
begin
	readln(n,b);
	for i:=1 to n do readln(a[i]);
	f[true,0,false]:=-1; f[true,0,true]:=-1;
	f[true,1,false]:=-1; f[true,1,true]:=0;
	g[true,0,false]:=0; g[true,0,true]:=-1;
	g[true,1,false]:=-1; g[true,1,true]:=-1;
	flag:=true;
	for i:=2 to n do begin
		flag:=not flag;
		for j:=0 to min(i,b) do begin
			f[flag,j,false]:=max(f[not flag,j,false],f[not flag,j,true]);
			g[flag,j,false]:=max(g[not flag,j,false],g[not flag,j,true]);
			if (j = 0) then begin
				f[flag,j,true]:=-1;
				g[flag,j,true]:=-1;
			end else begin
				if (f[not flag,j - 1,true] < 0) then f[flag,j,true]:=f[not flag,j - 1,false]
					else f[flag,j,true]:=max(f[not flag,j - 1,false],f[not flag,j - 1,true] + a[i]);
				if (g[not flag,j - 1,true] < 0) then g[flag,j,true]:=g[not flag,j - 1,false]
					else g[flag,j,true]:=max(g[not flag,j - 1,false],g[not flag,j - 1,true] + a[i]);
			end;
		end;
	end;
	ans:=max(max(f[flag,b,true] + a[1],f[flag,b,false]),max(g[flag,b,true],g[flag,b,false]));
	writeln(ans);
end.
