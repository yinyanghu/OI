var
        n       :       longint;
        num     :       string;
        i,j,k   :       longint;
begin
  read(n);
  if n=0 then writeln(10)
  else
  if n=1 then writeln(1)
  else
    begin
      for i:=9 downto 2 do
        while n mod i=0 do
          begin
            n:=n div i;
            num:=chr(48+i)+num;
          end;
      if n=1 then writeln(num) else writeln(-1);
    end;
end.