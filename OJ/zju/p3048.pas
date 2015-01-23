program p3048;
const
	maxn = 30;
var
	n,m:longint;
	a,c:array[1..maxn,1..maxn] of longint;
	flag:array[1..maxn,1..maxn] of boolean;
procedure init;
 var
 	i,j:longint;
 	ch:char;
 begin
 	fillchar(a,sizeof(a),0);
 	readln(n,m);
 	for i:=1 to n do begin
 		for j:=1 to m do begin
 			read(ch);
 			a[i,j]:=ord(ch) - 48;
 		end;
 		readln;
 	end;
 end;
 
function dfs(x,y,color:longint):longint;
 var
 	tot:longint;
 begin
 	tot:=1;
 	flag[x,y]:=false;
 	if (x + 1 <= n) and (a[x + 1,y] = color) and (flag[x + 1,y]) then tot:=tot + dfs(x + 1,y,color);
 	if (x - 1 >= 1) and (a[x - 1,y] = color) and (flag[x - 1,y]) then tot:=tot + dfs(x - 1,y,color);
 	if (y + 1 <= m) and (a[x,y + 1] = color) and (flag[x,y + 1]) then tot:=tot + dfs(x,y + 1,color);
 	if (y - 1 >= 1) and (a[x,y - 1] = color) and (flag[x,y - 1]) then tot:=tot + dfs(x,y - 1,color);
 	exit(tot);
 end;
 
function floodfill(var xx,yy:longint):longint;
 var
 	i,j,k,max:longint;
 begin
 	fillchar(flag,sizeof(flag),true);
 	max:=0;
 	for i:=1 to n do
 		for j:=1 to m do
 			if (a[i,j] <> 0) and (flag[i,j]) then begin
 				k:=dfs(i,j,a[i,j]);
 				if (k > max) then begin
 					max:=k;
 					xx:=i; yy:=j;
 				end;
 			end;
 	floodfill:=max;
 end;
 
procedure fill(x,y,color:longint);
 begin
 	a[x,y]:=0;
 	if (x + 1 <= n) and (a[x + 1,y] = color) then fill(x + 1,y,color);
	if (x - 1 >= 1) and (a[x - 1,y] = color) then fill(x - 1,y,color);
	if (y + 1 <= m) and (a[x,y + 1] = color) then fill(x,y + 1,color);
	if (y - 1 >= 1) and (a[x,y - 1] = color) then fill(x,y - 1,color);
 end;
 
procedure rebuild;
 var
 	apointer,bpointer,i,j:longint;
 	empty:boolean;
 begin
 	fillchar(c,sizeof(c),0);
 	bpointer:=0;
 	for j:=1 to m do begin
 		empty:=true;
 		for i:=1 to n do
 			if (a[i,j] <> 0) then begin
 				empty:=false;
 				break;
 			end;
		if empty then continue;
		inc(bpointer);
		apointer:=n + 1;
		for i:=n downto 1 do
			if (a[i,j] <> 0) then begin
				dec(apointer);
				c[apointer,bpointer]:=a[i,j];
			end;
	end;
	for i:=1 to n do
		for j:=1 to m do a[i,j]:=c[i,j];
 end;
 
procedure main;
 var
 	x,y,ans,k:longint;
 begin
 	ans:=0;
 	while true do begin
 		k:=floodfill(x,y);
 		if (k < 2) then break;
 		ans:=ans + k * (k - 1);
 		fill(x,y,a[x,y]);
 		rebuild;
 	end;
 	writeln(ans);
 end;
 
begin
	while not eof do begin
		init;
		main;
	end;
end.