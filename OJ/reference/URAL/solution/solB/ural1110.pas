var
        i,n,m,y,j,sum     :       longint;
        flag              :       boolean;

begin
  readln(n,m,y);
  for i:=0 to m-1 do
    begin
      sum:=1;
      for j:=1 to n do
        begin
          sum:=sum*i;
          sum:=sum mod m;
        end;
      if sum =y then
        begin
          write(i,' ');
          flag:=true;
        end;
    end;
  if not flag then writeln(-1)
              else writeln;
end.

