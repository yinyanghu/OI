program hungary;
const
	maxn = 100;
var
	c:array[1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	a:array[1..maxn,1..maxn] of boolean;
	n,m:longint;
	
procedure init;
 var
	p,i,x,y:longint;
 begin
	readln(n,m,p);
	fillchar(c,sizeof(c),0);
	fillchar(a,sizeof(a),false);
	for i:=1 to p do begin
		readln(x,y);
		a[x,y]:=true;
	end;
 end;
 
function extendpath(x:longint):boolean;
 var
	i:longint;
 begin
	for i:=1 to m do
		if (a[x,i]) and (flag[i]) then begin
			flag[i]:=false;
			if (c[i] = 0) or (extendpath(c[i])) then begin
				c[i]:=x;
				exit(true);
			end;
		end;
	extendpath:=false;
 end;
 
procedure main;
 var
	i,ans:longint;
 begin
	ans:=0;
	for i:=1 to n do begin
		fillchar(flag,sizeof(flag),true);
		if extendpath(i) then inc(ans);
	end;
	writeln(ans);
 end;
 
begin
	init;
	main;
end.
