program disjointsets;
const maxn=10000;
type node=record
         f,rank:longint;
     end;
var a:array[1..maxn] of node;
    i,n,m,p,s,t:longint;

function root(x:longint):longint;
 begin
     if a[x].f=-1 then exit(x)
	else begin
	    a[x].f:=root(a[x].f);
	    exit(a[x].f);
	end;
 end;

{function root(x:longint):longint;
 var t,y:longint;
 begin
     t:=x;
     while t<>a[t].f do t:=a[t].f;
     while a[x].f<>t do begin
         y:=a[x].f;
         a[x].f:=t;
         x:=y;
     end;
     root:=t;
 end;}

function get(x,y:longint):boolean;
 var r1,r2:longint;
 begin
     r1:=root(x); r2:=root(y);
     if r1=r2 then exit(false);
     if a[r1].rank=a[r2].rank then begin
         a[r2].f:=r1;
         inc(a[r1].rank);
         exit(true);
     end;
     if (a[r1].rank>a[r2].rank) then a[r2].f:=r1
        else a[r1].f:=r2;
     get:=true;
 end;

function find(x,y:longint):boolean;
 var k1,k2:longint;
 begin
     k1:=root(x); k2:=root(y);
     find:=k1=k2;
 end;

begin
    readln(n);
    fillchar(a,sizeof(a),255);
    readln(m);
    for i:=1 to m do begin
        read(p); readln(s,t);
        if p=1 then begin
            get(s,t);
        end else begin
            writeln(find(s,t));
        end;
    end;
end.