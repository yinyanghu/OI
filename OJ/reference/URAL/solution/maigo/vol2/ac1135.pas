program ural1135;
var
  n,i,right:word;
  turn:longint;
  c:char;
begin
  read(n);
  for i:=1 to n do begin
    repeat
      read(c);
    until (c='<') or (c='>');
    if c='>' then inc(right) else inc(turn,right);
  end;
  writeln(turn);
end.
