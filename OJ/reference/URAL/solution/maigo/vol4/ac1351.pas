program ural1351;
var
  d,x1,y1,x2,y2,n,i,x,y:longint;
begin
  read(d,x1,y1,x2,y2,n);d:=d*d;
  if x1*y2=x2*y1 then
    for i:=1 to n do begin
      read(x,y);
      if (x1*y=x*y1) and (x1*x+y1*y>0) and (x*x+y*y<=d) then writeln('YES') else writeln('NO');
    end
  else
    for i:=1 to n do begin
      read(x,y);
      if (x1*y>=x*y1) and (x2*y<=x*y2) and (x*x+y*y<=d) then writeln('YES') else writeln('NO');
    end;
end.
