var
        i,n,m,plus        :       longint;
begin
  readln(n);
  i:=n;
  m:=1;plus:=0;
  repeat
    if n mod 3=2 then
      begin
        inc(n);
        inc(plus,m);
      end;
    n:=n div 3;
    m:=m*3;
  until n=0;
if plus=0 then plus:=m;
writeln(i+plus,' ',plus);


end.