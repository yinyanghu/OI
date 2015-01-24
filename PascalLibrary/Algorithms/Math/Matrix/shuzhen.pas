program shuzhen;
var a,b:array[1..1000,1..1000] of integer;
    i,j,k,x,y,n:integer;
begin
   readln(n);
   for i:=1 to n do
    for j:=1 to n do begin
       a[i,j]:=0;
       b[i,j]:=1;
    end;

   for x:=n downto 1 do
    for y:=n downto 1 do begin
       for i:=1 to n do
         for j:=1 to n do a[i,j]:=a[i,j]+b[i,j];
       b[x,y]:=0;
    end;

    for i:=1 to n do begin
     writeln;
     for j:=1 to n do write(a[i,j]:4);
     end;
   readln;
end.
