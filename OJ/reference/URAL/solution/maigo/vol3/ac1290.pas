program ural1290;
const
  size=25000;
var
  count:array[1..size]of word;
  n,i,j:word;
begin
  read(n);
  for i:=1 to n do begin
    read(j);
    inc(count[j]);
  end;
  for i:=size downto 1 do
    for j:=1 to count[i] do
      writeln(i);
end.
