program ural1332;
const
  maxn=100;
  zero=1e-6;
var
  x,y:array[1..maxn]of integer;
  n,i,j,ans:byte;
  r,t:real;
function dist(x1,y1,x2,y2:real):real;
  begin
    dist:=sqrt(sqr(x1-x2)+sqr(y1-y2));
  end;
procedure bomb(a,b:real);
  var
    i,c:byte;
  begin
    c:=0;
    for i:=1 to n do
      if dist(a,b,x[i],y[i])<r+zero then inc(c);
    if c>ans then ans:=c;
  end;
begin
  read(n);
  for i:=1 to n do
    read(x[i],y[i]);
  read(r,t);r:=r-t;
  if r<0 then begin writeln(0);halt;end;

  ans:=1;
  for i:=1 to n-1 do
    for j:=i+1 to n do begin
      t:=dist(x[i],y[i],x[j],y[j]);
      if t<=r*2 then begin
        t:=sqrt(r*r-t*t/4)/t;
        bomb((x[i]+x[j])/2+t*(y[i]-y[j]),(y[i]+y[j])/2+t*(x[j]-x[i]));
        bomb((x[i]+x[j])/2-t*(y[i]-y[j]),(y[i]+y[j])/2-t*(x[j]-x[i]));
      end;
    end;

  writeln(ans);
end.
