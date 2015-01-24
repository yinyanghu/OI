program bird;
const maxn=100;
      maxm=100;
var c:array[1..maxn] of longint;
    a:array[1..maxn,1..maxm] of boolean;
    mark:array[1..maxn] of boolean;
    i,j,n,m,total:longint;
    ch:char;
function extendpath(x:longint):boolean;
 var i:longint;
 begin
     for i:=1 to m do 
	if (a[x,i]) and (not mark[i]) then begin
	    mark[i]:=true;
	    if (c[i]=0) or (extendpath(c[i])) then begin
		c[i]:=x; exit(true);
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
	    a[i,j]:=ch='1';
	end;
	readln;
    end;
    total:=0;
    for i:=1 to n do begin
	fillchar(mark,sizeof(mark),false);
	if extendpath(i) then inc(total);
    end;
    writeln(total);
end.
