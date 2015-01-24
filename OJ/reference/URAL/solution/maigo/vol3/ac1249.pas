program ural1249;
const
  size=3000;
var
  map:array[0..1,1..size]of byte;
  n,m,i,j:word;
procedure fail;
  begin
    writeln('No');
    halt;
  end;
begin
  read(n,m);
  for i:=1 to n do begin
    for j:=1 to m do
      read(map[i mod 2,j]);
    for j:=2 to m do
      if map[0,j-1]+map[0,j]+map[1,j-1]+map[1,j]=3 then fail;
  end;
  writeln('Yes');
end.
