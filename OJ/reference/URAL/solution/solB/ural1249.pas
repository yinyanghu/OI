var
        f1,f2        :       array[1..3000] of byte;
        n,m,i,j      :       longint;

begin
  read(n,m);
  for i:=1 to m do read(f1[i]);
  for i:=1 to n-1 do
    begin
      for j:=1 to m do
        read(f2[j]);
      for j:=1 to m-1 do
        if f1[j]+f1[j+1]+f2[j]+f2[j+1]=3 then
          begin
            writeln('No');
            halt;
          end;
      f1:=f2;
    end;
  writeln('Yes');
end.