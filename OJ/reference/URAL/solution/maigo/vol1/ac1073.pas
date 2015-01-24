program ural1073;
const
  maxn=60000;
var
  c:array[0..maxn]of word;
  n,i,j:word;
begin
  readln(n);
  for i:=0 to n do begin
    c[i]:=i;
    for j:=1 to trunc(sqrt(i)) do
      if c[i-j*j]+1<c[i] then
        c[i]:=c[i-j*j]+1;
  end;
  writeln(c[n]);
end.
