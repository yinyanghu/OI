program diandaoshuzu;
const n=100;
var a:array[1..n] of integer;
    i,j,k:integer;
procedure diandao(l,r:integer);
 var k:integer;
 begin
     if (l<r) then begin
         k:=a[l]; a[l]:=a[r]; a[r]:=k;
         diandao(l+1,r-1);
     end;
 end;
begin
    for i:=1 to n do a[i]:=i;
    diandao(1,n);
    writeln;
    for i:=1 to n do write(a[i]:4);
end.