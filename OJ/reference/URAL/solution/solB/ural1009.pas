var
        f       :       array[0..20] of longint;
        i,n,k   :       longint;
begin
  read(n,k);
  f[0]:=1;
  f[1]:=k-1;
  for i:=2 to n do f[i]:=(k-1)*(f[i-1]+f[i-2]);
  writeln(f[n]);
end.