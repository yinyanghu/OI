program ural1180;
var
  c:char;
  m:byte;
begin
  m:=0;
  repeat
    read(c);
    m:=(m+ord(c)) mod 3;
  until eoln;
  if m=0 then
    writeln(2)
  else begin
    writeln(1);
    writeln(m);
  end;
end.
