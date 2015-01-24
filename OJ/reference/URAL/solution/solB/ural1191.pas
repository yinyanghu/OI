var
        l,n,i,t1,t2,t :       longint;


begin
  read(l,n);
  t1:=l;t2:=0;
  for i:=1 to n do
    begin
      if t1<t2+t then
        begin
          writeln('YES');
          halt;
        end;
      inc(t1,t);
      inc(t2,t);
    end;
  writeln('NO');
end.