program ural1289;
var
  n,i:longint;
begin
  read(n);
  if n=2 then
    writeln(10)
  else begin
    for i:=1 to n div 2-1 do write(1);
    write(0);
    for i:=1 to n div 2-2 do write(8);
    writeln(90);
  end;
end.
