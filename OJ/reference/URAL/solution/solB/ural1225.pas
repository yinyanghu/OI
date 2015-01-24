var
        f       :       array[1..45] of cardinal;
        n,i,k   :       longint;
begin
  readln(n);
  f[1]:=2;
  f[2]:=2;
  for i:=3 to n do inc(f[i],f[i-1]+f[i-2]);
  writeln(f[n]);
end.