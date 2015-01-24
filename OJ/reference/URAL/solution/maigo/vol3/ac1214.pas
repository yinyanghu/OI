program ural1214;
var
  x,y:longint;
begin
  read(x,y);
  if (x>0) and (y>0) and odd(x+y) then
    writeln(y,' ',x)
  else
    writeln(x,' ',y);
end.
