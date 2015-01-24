program robot;{x,y already sort}
const maxn=100;
type node=record
	 x,y:longint;
     end;
var a:array[1..maxn,1..maxn] of boolean;
    c:array[1..maxn] of longint;
    s:array[1..maxn] of node;
    mark:array[1..maxn] of boolean;
    total,i,j,n:longint;
function extendpath(x:longint):boolean;
 var i:longint;
 begin
     for i:=1 to n do 
	if (a[x,i]) and (not mark[i]) then begin
	    mark[i]:=true;
	    if (c[i]=0) or (extendpath(c[i])) then begin
		c[i]:=x; exit(true);
	    end;
	end;
     extendpath:=false;
 end;

begin
    assign(input,'robot.in'); reset(input);
    readln(n);
    fillchar(a,sizeof(a),false);
    for i:=1 to n do begin
        readln(s[i].x,s[i].y);
	for j:=i-1 downto 1 do 
	   if s[i].x=s[j].y then a[j,i]:=true;
    end;
    close(input);
    total:=0;
    for i:=1 to n do begin
	fillchar(mark,sizeof(mark),false);
	if extendpath(i) then inc(total);
    end;
    writeln(n-total);
end.