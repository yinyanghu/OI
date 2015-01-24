//Written on 6176 -- Mar 24, 2005
program stone;
var
  t,u,n,i,x0,y0,x1,y1,x2,y2:longint;
  a,sx,sy,sa:extended;
begin
  read(t);
  for u:=1 to t do begin
    sx:=0;sy:=0;sa:=0;
    read(n,x0,y0);x2:=x0;y2:=y0;
    for i:=2 to n do begin
      x1:=x2;y1:=y2;read(x2,y2);
      a:=x1*y2-x2*y1;
      sx:=sx+(x1+x2)*a;sy:=sy+(y1+y2)*a;sa:=sa+a;
    end;
    x1:=x2;y1:=y2;x2:=x0;y2:=y0;
    a:=x1*y2-x2*y1;
    sx:=sx+(x1+x2)*a;sy:=sy+(y1+y2)*a;sa:=sa+a;
    writeln(sx/sa/3:0:2,' ',sy/sa/3:0:2);
  end;
end.
