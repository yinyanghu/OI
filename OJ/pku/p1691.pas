program p1691;
const
	maxn = 15;
	maxm = 1 shl maxn;
	maxcolor = 20;
	infinity = 100000000;
type
	node = record
		x1,y1,x2,y2,color:longint;
	end;
var
	f:array[0..maxm,1..maxcolor] of longint;
	connect:array[1..maxn,1..maxn] of boolean; //connect[i,j] j is above i
	a:array[1..maxn] of node;
	n,i,test:longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(n);
 	for i:=1 to n do readln(a[i].y1,a[i].x1,a[i].y2,a[i].x2,a[i].color);
 	for i:=1 to n do begin
 		connect[i,i]:=false;
 		for j:=1 to n do
 			if (i <> j) then
 				if (a[j].y2 <= a[i].y1) and ((a[j].x1 - a[i].x2) * (a[j].x2 - a[i].x1) < 0) then connect[i,j]:=true else connect[i,j]:=false;
 	end;
 end;
 
function check(cur,status:longint):boolean; inline;
 var
 	i:longint;
 begin
 	for i:=1 to n do
 		if (connect[cur,i]) and (status and (1 shl (i - 1)) = 0) then exit(false);
 	check:=true;
 end;
 
function min(a,b:longint):longint; inline;
 begin
 	if (a < b) then exit(a) else exit(b);
 end;
 
procedure main;
 var
 	m,ans,i,j,k,w,next:longint;
 begin
 	m:=1 shl n - 1;
 	
 	for i:=1 to maxcolor do f[0,i]:=1;
 	for i:=1 to m do
 		for j:=1 to maxcolor do f[i,j]:=infinity;
 	
 	for i:=0 to m do
 		for j:=1 to maxcolor do begin
 			for k:=1 to n do
 				if ((1 shl (k - 1)) and i = 0) and (a[k].color = j) and (check(k,i)) then begin
 					next:=i or (1 shl (k - 1));
 					f[next,j]:=min(f[next,j],f[i,j]);
 					for w:=1 to maxcolor do
 						if (w <> j) then f[next,w]:=min(f[next,w],f[i,j] + 1);
 				end;
 		end;
 	ans:=infinity;
 	for i:=1 to maxcolor do ans:=min(ans,f[m,i]);
 	writeln(ans);
 end;
 
begin
	readln(test);
	for i:=1 to test do begin
		init;
		main;
	end;
end.
