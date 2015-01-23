program p3049;
const
	maxn = 1000;
	infinity = 1000000000;
type
	node = record
		low,high:longint;
	end;
var
	a:array[1..maxn] of node;
	f:array[0..maxn] of longint;
	n,scroll,money:longint;
procedure init;
 var
 	s:string;
 	i,m,p,x,y:longint;
 begin
 	readln(m,scroll);
 	money:=0; n:=0;
 	for i:=1 to m do begin
 		readln(s);
 		p:=pos(' ',s);
 		if (p = 0) then begin
 			val(s,x);
 			money:=money + x;
 		end else begin
 			val(copy(s,1,p - 1),x);
 			delete(s,1,p);
 			val(s,y);
 			if (y - scroll <= x) then money:=money + x
 				else begin
 					inc(n);
 					a[n].low:=x; a[n].high:=y;
 				end;
 		end;
 	end;
 end;
 
function min(a,b:longint):longint;
 begin
 	if (a < b) then min:=a else min:=b;
 end;
 
procedure main;
 var
 	m,i,j:longint;
 begin
	if (money >= scroll) or (n = 0) then begin
		for i:=1 to n do money:=money + (a[i].high - scroll);
		writeln(money);
		exit;
	end;
	m:=scroll - money;
	for i:=0 to m do f[i]:=infinity;
	f[0]:=0;
	for i:=1 to n do
		if (a[i].low >= m) then f[m]:=min(f[m],a[i].high - scroll - a[i].low)
			else begin
				for j:=m - a[i].low to m do f[m]:=min(f[m],f[j] + a[i].high - scroll - a[i].low);
				for j:=m downto a[i].low do f[j]:=min(f[j],f[j - a[i].low] + a[i].high - scroll - a[i].low);
			end;
	if (f[m] = infinity) then begin
		for i:=1 to n do money:=money + a[i].low;
	end else begin
		for i:=1 to n do money:=money + a[i].high - scroll;
		money:=money - f[m];
	end;
	writeln(money);
 end;
 
begin
	while not eof do begin
		init;
		main;
	end;
end.