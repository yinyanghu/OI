program ural1161;
const
  maxn=100;
var
  m:array[1..maxn]of real;
  n,i,j:byte;
  t:real;
begin
  read(n);
  for i:=1 to n do
    read(m[i]);

  for i:=1 to n-1 do
    for j:=i+1 to n do
      if m[i]>m[j] then begin
        t:=m[i];m[i]:=m[j];m[j]:=t;
      end;

  for i:=n-1 downto 1 do
    m[i]:=2*sqrt(m[i]*m[i+1]);

  writeln(m[1]:0:2);
end.
