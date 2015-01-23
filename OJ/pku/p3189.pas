program p3189;
const
	maxn = 1001;
	maxb = 20;
type
	node = record
		size:longint;
		list:array[1..maxn] of longint;
	end;
var
	a:array[1..maxn,1..maxb] of longint;
	map:array[1..maxn,1..maxb] of boolean;
	f:array[1..maxb] of node;
	cap,w:array[1..maxb] of longint;
	flag:array[1..maxb] of boolean;
	n,b:longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(n,b);
 	for i:=1 to n do
 		for j:=1 to b do read(a[i,j]);
 	for i:=1 to b do read(w[i]);
 end;
 
function buildmap(x,len:longint):boolean;
 var
 	mark:array[1..maxb] of boolean;
 	i,j,tot:longint;
 begin
 	fillchar(mark,sizeof(mark),true);
 	for i:=1 to b do cap[i]:=w[i];
 	fillchar(map,sizeof(map),false);
 	tot:=0;
 	for i:=1 to n do
 		for j:=x to x + len do begin
 			if (mark[a[i,j]]) then begin
 				tot:=tot + w[a[i,j]];
 				mark[a[i,j]]:=false;
 			end;
 			map[i,a[i,j]]:=true;
 		end;
 	if (tot < n) then buildmap:=false else buildmap:=true;
 end;
 
function extendpath(x:longint):boolean;
 var
 	i,j:longint;
 begin
 	for i:=1 to b do
 		if (map[x,i]) and (flag[i]) then begin
 			flag[i]:=false;
 			if (cap[i] > 0) then begin
 				dec(cap[i]);
 				inc(f[i].size);
 				f[i].list[f[i].size]:=x;
 				exit(true);
 			end else begin
 				for j:=1 to f[i].size do
 					if (extendpath(f[i].list[j])) then begin
 						f[i].list[j]:=x;
 						exit(true);
 					end;
 			end;
 		end;
 	extendpath:=false;
 end;
 
function match:longint;
 var
 	i,tot:longint;
 begin
 	tot:=0;
 	fillchar(f,sizeof(f),0);
 	for i:=1 to n do begin
 		fillchar(flag,sizeof(flag),true);
 		if (extendpath(i)) then inc(tot);
 	end;
 	match:=tot;
 end;
 
procedure main;
 var
 	ans,i:longint;
 begin
 	for ans:=0 to b do
 		for i:=1 to (b - ans + 1) do
 			if (buildmap(i,ans)) then
 				if (match = n) then begin
 					writeln(ans + 1);
 					exit;
 				end;
 end;
 
begin
	init;
	main;
end.