program ural1262;
const
  d:array['0'..'9']of byte=(0,1,2,3,2,1,2,3,4,2);
var
  c:char;
  t:word;
begin
  repeat
    read(c);
    inc(t,d[c]);
  until eoln;
  writeln(t);
end.
