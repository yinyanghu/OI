program ural1011;
var
  p,q:real;
  a,b,c:integer;
begin
  readln(p,q);
  a:=round(p*100);b:=round(q*100);
  c:=1;
  repeat
    inc(c);
  until (c*a div 10000<c*b div 10000) and (c*b mod 10000>0);
  writeln(c);
end.
