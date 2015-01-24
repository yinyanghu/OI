program kruskal;
const maxn=1000;
type node=record
         x,y,dist:longint;
     end;
     data=record
         f,rank:longint;
     end;
var a:array[1..maxn] of data;
    w:array[1..maxn] of node;
    i,j,m,n,min:longint;
function root(x:longint):longint;
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
 end;

procedure get(x,y:longint);
 var r1,r2:longint;
 begin
     r1:=root(x); r2:=root(y);
     if r1=r2 then exit;
     if a[r1].rank=a[r2].rank then begin
         a[r2].f:=r1;
         inc(a[r1].rank);
         exit;
     end;
     if (a[r1].rank>a[r2].rank) then a[r2].f:=r1
        else a[r1].f:=r2;
 end;

function find(x,y:longint):boolean;
 var k1,k2:longint;
 begin
     k1:=root(x); k2:=root(y);
     find:=k1=k2;
 end;

procedure qsort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=w[(l+r) div 2].dist;
     repeat
        while w[i].dist<x do inc(i);
        while w[j].dist>x do dec(j);
        if i<=j then begin
            y:=w[i]; w[i]:=w[j]; w[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

begin
    assign(input,'kruskal.in'); reset(input);
    readln(n,m);
    for i:=1 to n do begin
        a[i].f:=i;
        a[i].rank:=0;
    end;
    for i:=1 to m do readln(w[i].x,w[i].y,w[i].dist);
    qsort(1,m); min:=0; j:=1;
    for  i:=1 to n-1 do begin
        while (find(w[j].x,w[j].y)) and (j<m) do inc(j);
        get(w[j].x,w[j].y);
        writeln(w[j].x,'-->',w[j].y,':',w[j].dist);
        min:=min+w[j].dist;
    end;
    writeln(min);
    close(input);
end.