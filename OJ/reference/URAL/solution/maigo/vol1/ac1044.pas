program ural1044;
var
  c:array[0..36]of integer;
  n,i,j,k:byte;
  s:longint;
begin
  fillchar(c,sizeof(c),0);
  readln(n);
  n:=n div 2;
  for i:=0 to 9 do
    c[i]:=1;
  for i:=1 to n-1 do
    for j:=9*i downto 0 do
      for k:=9 downto 1 do
        inc(c[j+k],c[j]);

  s:=0;
  for i:=0 to 9*n do
    inc(s,sqr(c[i]));
  writeln(s);
end.
