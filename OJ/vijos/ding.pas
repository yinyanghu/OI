program ding;
type data=record
         x,y:single;
     end;
var a:array[1..500] of data;
    n,i,j:longint;
    total,r:single;
begin
    readln(n,r);
    for i:=1 to n do readln(a[i].x,a[i].y);
    a[n+1]:=a[1];
    total:=r*pi*2;
    for i:=2 to n+1 do
      total:=total+sqrt(sqr(a[i].x-a[i-1].x)+sqr(a[i].y-a[i-1].y));
    writeln(total:0:2)
end.