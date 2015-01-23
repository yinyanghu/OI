program p132;
const
	maxn = 7;
	maxm = 70;
	maxstate = 3 * 3 * 3 * 3 * 3 * 3 * 3;
	infinity = 1000000000;
var
	block:array[-1..maxm,1..maxn] of boolean;
	shape:array[-2..0,1..maxn] of longint;
	state:array[1..maxn] of longint;
	f:array[1..maxm + 1,0..maxstate - 1] of longint;
	n,m,tot,curline,curstate:longint;
	
procedure init;
 var
 	ch:char;
 	i,j:longint;
 begin
 	fillchar(block,sizeof(block),0);
 	readln(m,n);
 	for i:=1 to m do begin
 		for j:=1 to n do begin
 			read(ch);
 			block[i,j]:=(ch = '*');
 		end;
 		readln;
 	end;
 	tot:=1;
 	for i:=1 to n do tot:=tot * 3;
 end;

function encode:longint;
 var
 	i,k:longint;
 begin
 	k:=0;
 	for i:=1 to n do
 		if (shape[0,i] <= 0) and (shape[-1,i] <= 0) then k:=k * 3
 			else if (shape[0,i] <= 0) and (shape[-1,i] > 0) then k:=k * 3 + 1
 				else if (shape[0,i] > 0) then k:=k * 3 + 2;
 	encode:=k;
 end;

procedure expandstate(depth,count:longint);
 var
 	next:longint;
 begin
 	if (depth > 1) and (curline > 2) and (shape[-2,depth - 1] = 0) and (shape[-1,depth - 1] = 0) then exit;
 	if (depth > 2) and (curline > 1) and (shape[-1,depth - 2] = 0) and (shape[-1,depth - 1] = 0) then exit;
 	if (depth > 2) and (curline = m) and (shape[0,depth - 2] = 0) and (shape[0,depth - 1] = 0) then exit;
 	if (depth > 1) and (curline = m) and (curline > 1) and (shape[-1,depth - 1] = 0) and (shape[0,depth - 1] = 0) then exit;
 	if (depth = n + 1) then begin
 		next:=encode;
 		if (f[curline,curstate] + count < f[curline + 1,next]) then
 			f[curline + 1,next]:=f[curline,curstate] + count;
 		exit;
 	end;
 	if (shape[0,depth] = 0) then begin
 		expandstate(depth + 1,count);
 		if (curline > 1) and (shape[-1,depth] = 0) then begin
 			shape[0,depth]:=1;
 			shape[-1,depth]:=3;
 			expandstate(depth + 1,count + 1);
 			shape[-1,depth]:=0;
 		end;
 		if (depth < n) and (shape[0,depth + 1] = 0) then begin
 			shape[0,depth]:=2;
 			shape[0,depth + 1]:=3;
 			expandstate(depth + 1,count + 1);
 			shape[0,depth + 1]:=0;
 		end;
 		shape[0,depth]:=0;
 	end else expandstate(depth + 1,count);
 end;

procedure buildshape;
 var
 	i,j,k:longint;
 begin
 	fillchar(shape,sizeof(shape),0);
 	for i:=-2 to 0 do
 		for j:=1 to n do
 			if (block[curline + i,j]) then shape[i,j]:=-1;
 	k:=curstate;
 	for i:=n downto 1 do begin
 		state[i]:=k mod 3;
 		k:=k div 3;
 	end;
 	for i:=1 to n do
 		if (state[i] = 1) then shape[-2,i]:=3
 			else if (state[i] = 2) then shape[-1,i]:=3;
 end;
	
procedure main;
 var
 	i,j,ans:longint;
 begin
  	for i:=1 to m + 1 do
  		for j:=0 to tot - 1 do f[i,j]:=infinity;
  	f[1,0]:=0;
  	for i:=1 to m do begin
  		curline:=i;
  		for j:=0 to tot - 1 do
  			if (f[i,j] <> infinity) then begin
  				curstate:=j;
  				buildshape;
  				expandstate(1,0);
  			end;
 	end;
 	ans:=infinity;
 	for i:=0 to tot - 1 do
 		if (f[m + 1,i] < ans) then ans:=f[m + 1,i];
 	writeln(ans);
 end;
	
begin
	init;
	main;
end.
