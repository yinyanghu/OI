var
        n,i         :       longint;
        j,k           :       dword;
begin
  read(n);
  for i:=1 to n do
    begin
      read(j);
      dec(j);
      j:=j shl 1;
      k:=trunc(sqrt(j));
      if k*(k+1)=j then write('1 ') else write('0 ');
    end;
  writeln;
end.