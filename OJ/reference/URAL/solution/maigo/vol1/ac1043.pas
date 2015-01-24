program ural1043;
const
  zero=1e-6;
var
  x1,y1,x2,y2,x3,y3,maxx,minx,maxy,miny:integer;
  x,y,r,alpha,beta,gamma:real;
  b:boolean;
function max(a,b:real):real;
  begin
    if a>b then max:=a else max:=b;
  end;
function min(a,b:real):real;
  begin
    if a<b then min:=a else min:=b;
  end;
function upint(a:real):integer;
  begin
    if abs(a-round(a))<zero then
      upint:=round(a)
    else
      if a>0 then upint:=trunc(a)+1 else upint:=trunc(a);
  end;
function downint(a:real):integer;
  begin
    if abs(a-round(a))<zero then
      downint:=round(a)
    else
      if a>0 then downint:=trunc(a) else downint:=trunc(a)-1;
  end;
procedure solve(var x,y:real;a1,b1,c1,a2,b2,c2:integer);
  begin
    x:=(c1*b2-c2*b1)/(a1*b2-a2*b1);
    y:=(c1*a2-c2*a1)/(b1*a2-b2*a1);
  end;
function angle(x1,y1:integer):real;
  begin
    if x1=x then
      if y1>y then angle:=pi*0.5 else angle:=pi*1.5
    else if x1>x then begin
      angle:=arctan((y1-y)/(x1-x));
      if angle<0 then angle:=angle+pi*2;
    end
    else
      angle:=arctan((y1-y)/(x1-x))+pi;
  end;
function onarc(angle:real):boolean;
  begin
    onarc:=((angle-alpha)*(angle-beta)<=0)=b;
  end;
begin
  readln(x1,y1,x2,y2,x3,y3);
  solve(x,y,2*(x1-x2),2*(y1-y2),x1*x1-x2*x2+y1*y1-y2*y2,
            2*(x1-x3),2*(y1-y3),x1*x1-x3*x3+y1*y1-y3*y3);
  {Solve the equation
    sqr(x1-x)+sqr(y1-y)=sqr(x2-x)+sqr(y2-y)=sqr(x3-x)+sqr(y3-y)}
  r:=sqrt(sqr(x1-x)+sqr(y1-y));
  alpha:=angle(x1,y1);beta:=angle(x2,y2);gamma:=angle(x3,y3);
  b:=(gamma-alpha)*(gamma-beta)<=0;
  if onarc(0) then maxx:=upint(x+r) else maxx:=upint(max(x1,x2));
  if onarc(pi*0.5) then maxy:=upint(y+r) else maxy:=upint(max(y1,y2));
  if onarc(pi) then minx:=downint(x-r) else minx:=downint(min(x1,x2));
  if onarc(pi*1.5) then miny:=downint(y-r) else miny:=downint(min(y1,y2));
  writeln((maxx-minx)*(maxy-miny));
end.
