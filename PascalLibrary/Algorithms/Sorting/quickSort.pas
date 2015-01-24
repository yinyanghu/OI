program quicksort;
var i,j,n,p,q:integer;
    a:array[1..10000] of integer;
 {**************************************************}
procedure sort(l,r:integer);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     //x:=a[random(j-i+1)+i];
     repeat
       while a[i]<x do inc(i);
       while a[j]>x do dec(j);
       if i<=j then begin
           y:=a[i]; a[i]:=a[j]; a[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 {**************************************************}
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);{0..100}
    sort(1,n);
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.
