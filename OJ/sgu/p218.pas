program p218;
const
	maxn = 500;
	infinity = 10000000;
var
	g:array[1..maxn,1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	link:array[1..maxn] of longint;
	best:array[1..maxn] of longint;
	left,right,limit,n:longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(n);
 	left:=infinity; right:=-infinity;
 	for i:=1 to n do begin
 		for j:=1 to n do begin
 			read(g[i,j]);
 			if (g[i,j] < left) then left:=g[i,j];
 			if (g[i,j] > right) then right:=g[i,j];
 		end;
 		readln;
 	end;
 end;
 
function extendpath(x:longint):boolean;
 var
 	p,i:longint;
 begin
 	result:=true;
 	if (x = 0) then exit;
 	for p:=0 to 1 do
 		for i:=1 to n do
 			if (g[x,i] <= limit) and (not flag[i]) and ((link[i] + p = 0) xor (link[i] * p > 0)) then begin
 				flag[i]:=true;
 				if (link[i] = 0) or (extendpath(link[i])) then begin
 					link[i]:=x;
 					exit;
 				end;
 			end;
 	result:=false;
 end;
 
function match:boolean;
 var
 	i:longint;
 begin
 	fillchar(link,sizeof(link),0);
 	result:=false;
 	for i:=1 to n do begin
 		fillchar(flag,sizeof(flag),false);
 		if (not extendpath(i)) then exit;
 	end;
 	result:=true;
 end;
 
procedure main;
 var
 	ans,i:longint;
 begin
 	ans:=infinity;
 	while (left <= right) do begin
 		limit:=(left + right) div 2; // attention! (left + right) might < 0
 		if (not match) then left:=limit + 1 else begin
 			right:=limit - 1;
 			if (limit < ans) then begin
 				ans:=limit;
 				for i:=1 to n do best[link[i]]:=i;
 			end;
 		end;
 	end;
 	writeln(ans);
 	for i:=1 to n do writeln(i,' ',best[i]);
 end;
 
begin
	init;
	main;
end.
