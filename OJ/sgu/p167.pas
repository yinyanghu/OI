program p167;
const
	maxn = 15;
	maxm = 15;
type
	node = record
		pleft,pright:longint;
		pgoleft,pgoright:boolean;
	end;
var
	sum:array[1..maxn,0..maxm] of longint;
	f:array[1..maxn,1..maxm,1..maxm,boolean,boolean,0..maxn * maxm] of longint;
	path:array[1..maxn,1..maxm,1..maxm,boolean,boolean,0..maxn * maxm] of node;
	n,m,tot:longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(n,m,tot);
 	for i:=1 to n do begin
 		sum[i,0]:=0;
 		for j:=1 to m do begin
 			read(sum[i,j]);
 			sum[i,j]:=sum[i,j] + sum[i,j - 1];
 		end;
 		readln;
 	end;
 end;

function max(a,b:longint):longint;
 begin
 	if (a > b) then max:=a else max:=b;
 end;

procedure main;
 var
 	line,left,right,remain:longint;
 	i,prevleft,prevright,prevline:longint;
 	leftlimit,rightlimit:longint;
 	goleft,goright,prevgoleft,prevgoright,l1,l2:boolean;
 	ans:longint;
 begin
 	fillchar(f,sizeof(f),0);
 	fillchar(path,sizeof(path),0);
 	for left:=1 to m do
 		for right:=left to m do
 			for goleft:=false to true do
 				for goright:=false to true do
 					f[1,left,right,goleft,goright,right - left + 1]:=sum[1,right] - sum[1,left - 1];
 	for line:=2 to n do
 		for left:=1 to m do
 			for right:=left to m do
 				for goleft:=false to true do
 					for goright:=false to true do
 						for remain:=(right - left + 1) to tot do begin
 							if goleft then leftlimit:=1 else leftlimit:=left;
 							if goright then rightlimit:=m else rightlimit:=right;
 							for prevleft:=leftlimit to right do
 								for prevright:=max(left,prevleft) to rightlimit do begin
 									l1:=(prevleft <= left) and goleft;
 									l2:=(prevright >= right) and goright;
									for prevgoleft:=false to l1 do
 										for prevgoright:=false to l2 do begin
 											if (f[line,left,right,goleft,goright,remain] < f[line - 1,prevleft,prevright,prevgoleft,prevgoright,remain - (right - left + 1)] + sum[line,right] - sum[line,left - 1]) then begin
 												f[line,left,right,goleft,goright,remain]:=f[line - 1,prevleft,prevright,prevgoleft,prevgoright,remain - (right - left + 1)] + sum[line,right] - sum[line,left - 1];
 												with path[line,left,right,goleft,goright,remain] do begin
 													pleft:=prevleft;
 													pright:=prevright;
 													pgoleft:=prevgoleft;
 													pgoright:=prevgoright;
 												end;
 											end;
 										end;
 								end;
 						end;
 	ans:=0;
 	for line:=1 to n do
 		for left:=1 to m do
 			for right:=left to m do
 				for goleft:=false to true do
 					for goright:=false to true do
 						if (f[line,left,right,goleft,goright,tot] > ans) then begin
 							ans:=f[line,left,right,goleft,goright,tot];
 							prevleft:=left;
 							prevright:=right;
 							prevgoleft:=goleft;
 							prevgoright:=goright;
 							prevline:=line;
 						end;
 	writeln('Oil : ',ans);
 	line:=prevline;
 	left:=prevleft;
 	right:=prevright;
 	goleft:=prevgoleft;
 	goright:=prevgoright;
 	while (tot > 0) do begin
 		prevleft:=path[line,left,right,goleft,goright,tot].pleft;
 		prevright:=path[line,left,right,goleft,goright,tot].pright;
 		prevgoleft:=path[line,left,right,goleft,goright,tot].pgoleft;
 		prevgoright:=path[line,left,right,goleft,goright,tot].pgoright;
 		for i:=left to right do writeln(line,' ',i);
 		dec(tot,right - left + 1);
 		dec(line);
 		left:=prevleft;
 		right:=prevright;
 		goleft:=prevgoleft;
 		goright:=prevgoright;
 	end;
 end;
	
begin
	init;
	main;
end.
