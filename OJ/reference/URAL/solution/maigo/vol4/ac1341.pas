program ural1341;
const
  c=2*pi*6400;
var
  x,y,l,t:extended;
begin
  read(x,y,l);
  y:=y+l/(c*cos(x*pi/180+l/c*2*pi))*360-l/(c*cos(x*pi/180))*360;
  y:=y-trunc(y/360)*360;
  if y>180 then y:=y-360 else if y<=-180 then y:=y+360;
  writeln(x:0:3);
  writeln(y:0:3);
end.
