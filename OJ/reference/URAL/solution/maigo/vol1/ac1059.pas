program ural1059;
var
  n,i:word;
begin
  readln(n);
  writeln(0);
  for i:=1 to n do begin
    writeln('X');
    writeln('*');
    writeln(i);
    writeln('+');
  end;
end.
