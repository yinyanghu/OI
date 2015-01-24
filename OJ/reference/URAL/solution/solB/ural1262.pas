const
  d : array [ '0' .. '9' ] of longint = (0,1,2,3,2,1,2,3,4,2);

var
  c : char;
  t : longint;

begin
  t:=0;
  repeat
    read(c);
    inc(t,d[c]);
  until eoln;
  writeln(t);
end.
