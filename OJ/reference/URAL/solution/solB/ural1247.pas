var
        s,n,i,j,sum,ans     :       longint;

begin
  read(s,n);
  ans:=0;
  for i:=1 to s do
    begin
      read(j);
      inc(sum,j-1);
      if sum>ans then ans:=sum;
      if sum<0 then sum:=0;
      if ans>n then
        begin
          writeln('NO');
          halt;
        end;
    end;
  writeln('YES');
end.
