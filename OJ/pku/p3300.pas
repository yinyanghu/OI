program p3300;
var x,y:array[1..10] of longint;
    s:array[1..100] of double;
    i,j,m,n,p:longint;
    max:double;
procedure sort(l,r:longint);
 var i,j:longint;
     x,y:double;
 begin
     i:=l; j:=r; x:=s[(l+r) div 2];
     repeat
       while s[i]<x do inc(i);
       while s[j]>x do dec(j);
       if i<=j then begin
           y:=s[i]; s[i]:=s[j]; s[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    while not eof do begin
        read(n);
        if n=0 then halt;
        readln(m);
        for i:=1 to n do read(x[i]);
        for i:=1 to m do read(y[i]);
        p:=0;
        for i:=1 to n do
          for j:=1 to m do begin
              inc(p);
              s[p]:=y[j]/x[i];
          end;
        sort(1,p);
        max:=0;
        for i:=2 to p do
          if s[i]/s[i-1]>max then max:=s[i]/s[i-1];
        writeln(max:0:2);
    end;
end.