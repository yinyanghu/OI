program p1170;
const
	maxn = 5;
	maxm = 5;
	maxcode = 999;
	maxs = 99;
	bit = 6;
	maxf = 46656; //  6 ^ 6
	infinity = 100000000;
type
	node = record
		size,price:longint;
	end;
	reduce = record
		price,stat:longint;
	end;
var
	w:array[0..maxn] of longint;
	num:array[1..maxcode] of longint;
	good:array[1..maxn] of node;
	s:array[1..maxs + maxn] of reduce;
	f:array[0..maxf] of longint;
	flag:array[0..maxf] of boolean;
	n,m,tot:longint;
	
procedure init;
 var
 	i,j,k,a,b:longint;
 begin
 	w[0]:=1;
 	for i:=1 to maxn do w[i]:=w[i - 1] * bit;
 	
 	readln(n);
 	tot:=0;
 	for i:=1 to n do begin
 		readln(k,good[i].size,good[i].price);
 		num[k]:=i;
 		tot:=tot + w[i - 1] * good[i].size;
 	end;
 	
 	readln(m);
 	for i:=1 to m do begin
 		read(k);
 		s[i].stat:=0;
 		for j:=1 to k do begin
 			read(a,b);
 			s[i].stat:=s[i].stat + w[num[a] - 1] * b;
 		end;
 		readln(s[i].price);
 	end;
 	for i:=1 to n do begin
 		s[i + m].stat:=w[i - 1];
 		s[i + m].price:=good[i].price;
 	end;
 	m:=m + n;
 end;

function check(x:longint):boolean;
 var
 	i:longint;
 begin
 	for i:=1 to n do begin
 		if (x mod bit > good[i].size) then exit(false);
 		x:=x div bit;
 	end;
 	check:=true;
 end;
 
function min(a,b:longint):longint;
 begin
 	if (a < b) then min:=a else min:=b;
 end;

procedure main;
 var
 	i,j:longint;
 begin
 	for i:=1 to tot do begin
 		f[i]:=infinity;
 		flag[i]:=check(i);
 	end;
 	f[0]:=0; flag[0]:=true;
 	for i:=0 to tot do
 		if (flag[i]) then begin
 			for j:=1 to m do
 				if (flag[i + s[j].stat]) then f[i + s[j].stat]:=min(f[i + s[j].stat],f[i] + s[j].price);
 		end;
 	writeln(f[tot]);
 end;

begin
	init;
	main;
end.
