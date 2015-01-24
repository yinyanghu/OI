var
        map     :       array[1..100,1..100] of longint;
        i,j,k,n :       longint;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to i do
      begin
        inc(k);
        map[j][n-i+j]:=k;
      end;
  k:=n*n;
  for i:=1 to n-1 do
    for j:=i downto 1 do
      begin
        map[n-i+j][j]:=k;
        dec(k);
      end;

  for i:=1 to n do
    begin
      for j:=1 to n do
        begin
          write(map[i,j],' ');
         // if j<>n then write(' ');
        end;
      writeln;
    end;
end.