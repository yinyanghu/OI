var
        a       :       array[1..30000] of longint;
        n,i,j   :       longint;
begin
  read(n);
  for i:=1 to n do
    begin
      read(j);
      inc(a[j]);
    end;
  for i:=30000 downto 1 do
    for j:=a[i] downto 1 do
      writeln(i);
end.

