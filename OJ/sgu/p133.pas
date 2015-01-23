program p133;
type node=record
         x,y:longint;
     end;
var a:array[1..16000] of node;
    i,n,total,max:longint;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].x;
     repeat
         while a[i].x<x do inc(i);
         while a[j].x>x do dec(j);
         if i<=j then begin
             y:=a[i].x; a[i].x:=a[j].x; a[j].x:=y;
             y:=a[i].y; a[i].y:=a[j].y; a[j].y:=y;
             inc(i); dec(j);
         end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    sort(1,n);
    total:=0; max:=a[1].y;
    for i:=2 to n do
      if a[i].y<max then inc(total)
        else max:=a[i].y;
    writeln(total);
end.