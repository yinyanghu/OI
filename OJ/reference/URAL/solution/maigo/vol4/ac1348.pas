program ural1348;
var
  xa,ya,xb,yb,xc,yc,l:longint;
  da,db,d:real;
function dot(x0,y0,x1,y1,x2,y2:longint):longint;
  begin
    dec(x1,x0);dec(y1,y0);
    dec(x2,x0);dec(y2,y0);
    dot:=x1*x2+y1*y2;
  end;
function cross(x0,y0,x1,y1,x2,y2:longint):longint;
  begin
    dec(x1,x0);dec(y1,y0);
    dec(x2,x0);dec(y2,y0);
    cross:=x1*y2-x2*y1;
  end;
begin
  read(xa,ya,xb,yb,xc,yc,l);
  da:=sqrt(sqr(xa-xc)+sqr(ya-yc));
  db:=sqrt(sqr(xb-xc)+sqr(yb-yc));
  if (dot(xa,ya,xb,yb,xc,yc)>0) and (dot(xb,yb,xa,ya,xc,yc)>0) then
    d:=abs(cross(xc,yc,xa,ya,xb,yb))/sqrt(sqr(xa-xb)+sqr(ya-yb))
  else
    if da<db then d:=da else d:=db;
  if d>l then writeln(d-l:0:2) else writeln('0.00');
  if da>db then d:=da else d:=db;
  if d>l then writeln(d-l:0:2) else writeln('0.00');
end.
