program fireboat;
var n,i,m,x,y,max,total:longint;
    a,b:array[1..20000] of longint;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     repeat
         while a[i]<x do inc(i);
         while a[j]>x do dec(j);
         if i<=j then begin
             y:=a[i]; a[i]:=a[j]; a[j]:=y;
             y:=b[i]; b[i]:=b[j]; b[j]:=y;
             inc(i); dec(j);
         end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(m); n:=0;
    for i:=1 to m do begin
        readln(x,y);
        if x<>y then begin
            inc(n);
            a[n]:=x; b[n]:=y;
        end;
    end;
    sort(1,n);
    max:=b[1]-a[1]; total:=b[1];
    for i:=2 to n do
      if total<=a[i] then begin
          max:=b[i]-a[i]+max;
          total:=b[i];
      end else if total<b[i] then begin
          max:=b[i]-total+max;
          total:=b[i];
      end;
    writeln(max);
end.
