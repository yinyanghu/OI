program maxmin;
var n,i:integer;
    max,min:integer;
    a:array[1..100] of integer;
procedure num(i,j:integer;var max,min:integer);
 var mid:integer;
     max1,max2,min1,min2:integer;
 begin
     if (i=j) then begin
         max:=a[i];
         min:=a[j];
     end else begin
         mid:=(i+j) div 2;
         num(i,mid,max1,min1);
         num(mid+1,j,max2,min2);
         if max1>max2 then max:=max1 else max:=max2;
         if min1>min2 then min:=min2 else min:=min1;
     end;
 end;
begin
    randomize;
    readln(n);
    for i:=1 to n do a[i]:=random(n)+1;
    for i:=1 to n do write(a[i]:4);
    num(1,n,max,min);
    writeln('Max=',max,'  Min=',min);
    readln;
end.