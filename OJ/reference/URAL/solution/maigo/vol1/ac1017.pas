program ural1017;
const
  maxn=500;
var
  q:array[0..maxn]of int64;
  n,i,j:integer;
begin
  fillchar(q,sizeof(q),0);
  readln(n);
  q[0]:=1;
  for i:=1 to n do
    for j:=n downto i do
      inc(q[j],q[j-i]);
  writeln(q[n]-1);
end.
