//Written on 6106 -- Jan 13, 2005
program fctrl;
var
  t,i,n,c:longint;
begin
  read(t);
  for i:=1 to t do begin
    read(n);c:=0;
    while n>4 do begin
      inc(c,n div 5);
      n:=n div 5;
    end;
    writeln(c);
  end;
end.
