program flyman;
type data=record
         t,v:longint;
     end;
var a:array[1..500] of data;
    f:array[0..2000] of longint;
    t,m,i,j:longint;

function max(x,y:longint):longint;
 begin
     if x>y then max:=x else max:=y;
 end;

begin
    readln(m);
    readln(t);
    for i:=1 to m do read(a[i].v,a[i].t);
    fillchar(f,sizeof(f),0);
    for i:=1 to m do
      for j:=t downto a[i].t do
         f[j]:=max(f[j-a[i].t]+a[i].v,f[j]);
    writeln(f[t]);
end.
