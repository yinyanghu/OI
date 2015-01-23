program p2226;
const
	maxn = 50;
	maxm =2000;
	limitsize = 50;
type
	node = record
		size:longint;
		list:array[1..limitsize] of longint
	end;
var
	c:array[1..maxm] of longint;
	a:array[1..maxn,1..maxn] of boolean;
	w:array[1..maxm] of node;
	x,y:array[1..maxn,1..maxn] of longint;
	mark:array[1..maxm] of boolean;
	i,j,n,m,total,totx,toty:longint;
	ch:char;

function extendpath(x:longint):boolean;
 var
	i,y:longint;
 begin
	for i:=1 to w[x].size do begin
		y:=w[x].list[i];
		if (not mark[y]) then begin
			mark[y]:=true;
			if (c[y] = 0) or (extendpath(c[y])) then begin
				c[y]:=x; exit(true);
			end;
		end;
	end;
	extendpath:=false;
 end;

begin
	fillchar(c,sizeof(c),0);
	readln(n,m);
	for i:=1 to n do begin
		for j:=1 to m do begin
			read(ch);
			a[i,j]:=ch='*';
		end;
		readln;
	end;
	fillchar(x,sizeof(x),255);
	fillchar(y,sizeof(y),255);
	totx:=0; toty:=0;
	for i:=1 to n do
		for j:=1 to m do
			if (a[i,j]) then begin
				if (j = 0) or (not a[i,j - 1]) then inc(totx);
				x[i,j]:=totx;
			end;
	for j:=1 to m do
		for i:=1 to n do
			if (a[i,j]) then begin
				if (i = 0) or (not a[i - 1,j]) then inc(toty);
				y[i,j]:=toty;
			end;
	for i:=1 to totx do w[i].size:=0;
	for i:=1 to n do
		for j:=1 to m do
			if (x[i,j] <> -1) and (y[i,j] <> -1) then begin
				inc(w[x[i,j]].size);
				w[x[i,j]].list[w[x[i,j]].size]:=y[i,j];
			end;
	total:=0;
	for i:=1 to totx do begin
		fillchar(mark,sizeof(mark),false);
		if extendpath(i) then inc(total);
	end;
	writeln(total);
end.