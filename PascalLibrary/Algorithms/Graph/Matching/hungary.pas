program hungary;
const maxn=100;
var c:array[1..maxn] of longint;
    a:array[1..maxn,1..maxn] of boolean;
    mark:array[1..maxn] of boolean;
    total,i,n,m,p,x,y:longint;
function extendpath(u:longint):boolean;
 var v:longint;
 begin
     for v:=1 to m do 
         if (a[u,v]) and (not mark[v]) then begin
	     mark[v]:=true;
	     if (c[v]=0) or (extendpath(c[v])) then begin
		 c[v]:=u;
		 exit(true);
	     end;
         end;
     extendpath:=false;
 end;

begin
    fillchar(c,sizeof(c),0);
    fillchar(a,sizeof(a),false);
    readln(n,m,p); total:=0;
    for i:=1 to p do begin
	readln(x,y);
	a[x,y]:=true;
    end;
    for i:=1 to n do begin
        fillchar(mark,sizeof(mark),false);
        if extendpath(i) then inc(total);
    end;
    writeln(total);
end.
