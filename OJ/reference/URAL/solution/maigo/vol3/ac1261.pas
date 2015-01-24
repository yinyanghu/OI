program ural1261;
var
  n,bill,tip,m:longint;
begin
  read(n);bill:=n;m:=1;
  repeat
    if n mod 3=2 then begin
      inc(tip,m);
      inc(n);
    end;
    n:=n div 3;m:=m*3;
  until n=0;
  if tip=0 then tip:=m;
  writeln(bill+tip,' ',tip);
end.
