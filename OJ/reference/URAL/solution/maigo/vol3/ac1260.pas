program ural1260;
const
  maxn=55;
var
  a:array[1..maxn]of longint;
  n,i:byte;
begin
  a[1]:=1;a[2]:=1;a[3]:=2;
  read(n);
  for i:=4 to n do
    a[i]:=a[i-1]+a[i-3]+1;
  writeln(a[n]);
end.
