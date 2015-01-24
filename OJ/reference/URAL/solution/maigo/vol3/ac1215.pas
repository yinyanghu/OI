program ural1215;
const
  maxn=100;
var
  x,y:array[0..maxn]of longint;
  x0,y0:longint;
  n,i:byte;
  ans:real;
function min(a,b:real):real;
  begin
    if a<b then min:=a else min:=b;
  end;
function cross(xa,ya,xb,yb,xc,yc:int64):int64;
  var
    x1,y1,x2,y2:int64;
  begin
    x1:=xb-xa;y1:=yb-ya;
    x2:=xc-xa;y2:=yc-ya;
    cross:=x1*y2-x2*y1;
  end;
function dot(xa,ya,xb,yb,xc,yc:int64):int64;
  var
    x1,y1,x2,y2:int64;
  begin
    x1:=xb-xa;y1:=yb-ya;
    x2:=xc-xa;y2:=yc-ya;
    dot:=x1*x2+y1*y2;
  end;
function dist(xa,ya,xb,yb:int64):real;
  begin
    dist:=sqrt(sqr(xa-xb)+sqr(ya-yb));
  end;
function perp(x,y,xa,ya,xb,yb:int64):real;
  begin
    perp:=abs(cross(xa,ya,x,y,xb,yb)/dist(xa,ya,xb,yb));
  end;
function inside:boolean;
  var
    i:byte;
  begin
    for i:=1 to n do
      if cross(x0,y0,x[i-1],y[i-1],x[i],y[i])<0 then begin
        inside:=false;
        exit;
      end;
    inside:=true;
  end;
begin
  read(x0,y0,n);
  for i:=1 to n do
    read(x[i],y[i]);
  x[0]:=x[n];y[0]:=y[n];

  ans:=1e38;
  if inside then
    ans:=0
  else
    for i:=1 to n do
      if (dot(x[i-1],y[i-1],x[i],y[i],x0,y0)<0) or
         (dot(x[i],y[i],x[i-1],y[i-1],x0,y0)<0) then
        ans:=min(ans,min(dist(x0,y0,x[i-1],y[i-1]),dist(x0,y0,x[i],y[i])))
      else
        ans:=min(ans,perp(x0,y0,x[i-1],y[i-1],x[i],y[i]));

  writeln(ans*2:0:3);
end.
