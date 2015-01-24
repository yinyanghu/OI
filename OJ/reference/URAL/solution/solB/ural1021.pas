var
        f       :       array[-100000..100000] of boolean;
        i,j,k   :       longint;
        flag    :       boolean;
begin
  readln(k);
  for i:=1 to k do
    begin
      readln(j);
      f[j]:=true;
    end;
  readln(k);
  for i:=1 to k do
    begin
      readln(j);
      if f[10000-j] then flag:=true;
    end;
  if flag then writeln('YES')
          else writeln('NO');
end.