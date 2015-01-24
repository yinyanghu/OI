program ural1328;
const
  zero=1e-6;
var
  w,h,x1,y1,x2,y2,x3,y3,dist,angle,t:real;
  n,i:shortint;
function look(x1,y1,x2,y2:real):real;
  var
    t:real;
  begin
    if abs(x1-x2)<zero then
      if abs(y1-y2)<zero then
        look:=0
      else if y2>y1 then
        look:=90
      else
        look:=270
    else begin
      t:=arctan((y2-y1)/(x2-x1))*180/pi;
      if x2<x1 then
        look:=t+180
      else if y2<y1 then
        look:=t+360
      else
        look:=t;
    end;
  end;
procedure check(a,b:shortint);
  begin
    if odd(a) then x3:=(a+1)*w-x2 else x3:=a*w+x2;
    if odd(b) then y3:=(b+1)*h-y2 else y3:=b*h+y2;
    t:=sqr(x1-x3)+sqr(y1-y3);
    if t<dist then begin
      dist:=t;angle:=look(x1,y1,x3,y3);
    end
    else if abs(t-dist)<zero then begin
      t:=look(x1,y1,x3,y3);if t<angle then angle:=t;
    end;
  end;
begin
  read(w,h,n,x1,y1,x2,y2);
  if (n=0) then begin
    writeln(look(x1,y1,x2,y2):0:2);
    halt;
  end;
  dist:=1e38;angle:=360;
  for i:=1 to n do begin
    check(i,n-i);
    check(n-i,-i);
    check(-i,i-n);
    check(i-n,i);
  end;
  writeln(angle:0:2);
end.
