program ural1285;
const
  dimen=8;{This prog is just one digit different from 1075}
  zero=1e-6;
type
  dot=array[1..dimen]of real;
var
  a,b,c:dot;
  r,x,y,z,t,d,ans:real;
procedure readdot(var a:dot);
  var
    i:byte;
  begin
    for i:=1 to dimen do
      read(a[i]);
  end;
function dist(a,b:dot):real;
  var
    d:real;
    i:byte;
  begin
    d:=0;
    for i:=1 to dimen do
      d:=d+sqr(a[i]-b[i]);
    dist:=sqrt(d);
  end;
function arccos(c:real):real;
  begin
    if abs(c)<zero then
      arccos:=pi/2
    else if c>0 then
      arccos:=arctan(sqrt(1-c*c)/c)
    else
      arccos:=pi+arctan(sqrt(1-c*c)/c);
  end;
begin
  readdot(a);readdot(b);readdot(c);read(r);
  x:=dist(a,c);y:=dist(b,c);z:=dist(a,b);
  if (x*x+z*z<=y*y) or (y*y+z*z<=x*x) then
    ans:=z
  else begin
    t:=arccos((x*x+y*y-z*z)/(2*x*y));
    d:=x*y*sin(t)/z;
    if d>=r then ans:=z else ans:=sqrt(x*x-r*r)+sqrt(y*y-r*r)+r*(t-arccos(r/x)-arccos(r/y));
  end;
  writeln(ans:0:2);
end.
