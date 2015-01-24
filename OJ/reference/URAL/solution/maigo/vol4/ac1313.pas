program ural1313;
const
  maxn=100;
var
  map:array[1..maxn,1..maxn]of byte;
  n,i,j:byte;
begin
  read(n);
  for i:=1 to n do
    for j:=1 to n do
      read(map[i,j]);
  if n>1 then
    for i:=1 to n do
      for j:=1 to i do
        write(map[i+1-j,j],' ');
  for i:=2 to n-1 do
    for j:=i to n do
      write(map[n+i-j,j],' ');
  writeln(map[n,n]);
end.
