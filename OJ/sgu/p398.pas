program p398;
const
	maxn = 50;
	infinity = 100000000;
var
	a:array[1..maxn,1..maxn] of boolean;
	flag:array[1..maxn] of boolean;
	f:array[1..maxn] of longint;
	x,n:longint;

procedure init;
 var
	i,j,k,m:longint;
 begin
	readln(n,x);
	fillchar(a,sizeof(a),false);
	for i:=1 to n do begin
		read(k);
		for j:=1 to k do begin
			read(m);
			a[i,m]:=true;
			a[m,i]:=true;
		end;
	end;
 end;

procedure find;
 var
	i,k,min:longint;
 begin
	for i:=1 to n do begin
		flag[i]:=true;
		f[i]:=infinity;
	end;
	f[x]:=0;
	repeat
		min:=infinity;
		for i:=1 to n do
			if (flag[i]) and (f[i] < min) then begin
				min:=f[i];
				k:=i;
			end;
		if (min = infinity) then break;
		flag[k]:=false;
		for i:=1 to n do
			if (a[k,i]) and (flag[i]) and (f[k] + 1 < f[i]) then f[i]:=f[k] + 1;
	until false;
 end;

procedure print;
 var
	i,tot:longint;
 begin
	tot:=0;
	for i:=1 to n do
		if (f[i] = 2) then inc(tot);
	writeln(tot);
	for i:=1 to n do
		if (f[i] = 2) then writeln(i);
 end;

begin
	init;
	find;
	print;
end.