program ural1225;
const
  maxn=45;
var
  f:array[1..maxn]of cardinal;
  n,i:byte;
begin
  read(n);
  f[1]:=2;f[2]:=2;
  for i:=3 to n do
    f[i]:=f[i-1]+f[i-2];
  writeln(f[n]);
end.
