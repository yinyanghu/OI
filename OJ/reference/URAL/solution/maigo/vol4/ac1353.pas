program ural1353;
const
  maxs=81;
var
  a:array[0..maxs]of longint;
  i,j,k:byte;
begin
  a[0]:=1;
  for i:=1 to 9 do
    for j:=9*i downto 1 do
      for k:=1 to 9 do begin
        if k>j then break;
        inc(a[j],a[j-k]);
      end;
  inc(a[1]);
  read(i);
  writeln(a[i]);
end.
