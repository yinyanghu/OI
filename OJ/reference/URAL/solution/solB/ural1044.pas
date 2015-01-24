var
        f               :       array[0..36] of longint;
        n,s,i,j,k       :       longint;
begin
  fillchar(f,sizeof(f),0);
  readln(n);
  n:=n shr 1;
  for i:=0 to 9 do f[i]:=1;
  for i:=1 to n-1 do
   for j:=i*9 downto 0 do
     for k:=9 downto 1 do
        inc(f[j+k],f[j]);
  s:=0;
  for i:=0 to n*9 do
    inc(s,sqr(f[i]));
  writeln(s);
end.