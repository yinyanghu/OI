program p3041;
const
	maxn = 500;
var
	c:array[1..maxn] of longint;
	a:array[1..maxn,1..maxn] of boolean;
	mark:array[1..maxn] of boolean;
	i,n,m,total,x,y:longint;

function extendpath(x:longint):boolean;
 var
	i:longint;
 begin
	for i:=1 to n do 
		if (a[x,i]) and (not mark[i]) then begin
			mark[i]:=true;
			if (c[i] = 0) or (extendpath(c[i])) then begin
				c[i]:=x; exit(true);
			end;
		end;
	extendpath:=false;
 end;

begin
	fillchar(c,sizeof(c),0);
	fillchar(a,sizeof(a),false);
	readln(n,m);
	for i:=1 to m do begin
		readln(x,y);
		a[x,y]:=true;
	end;
	total:=0;
	for i:=1 to n do begin
		fillchar(mark,sizeof(mark),false);
		if extendpath(i) then inc(total);
	end;
	writeln(total);
end.
