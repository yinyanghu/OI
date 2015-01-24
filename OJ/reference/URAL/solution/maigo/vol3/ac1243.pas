program ural1243;
var
  c:char;
  r:byte;
begin
  repeat
    read(c);
    r:=(r*10+ord(c)-48) mod 7;
  until eoln;
  writeln(r);
end.
