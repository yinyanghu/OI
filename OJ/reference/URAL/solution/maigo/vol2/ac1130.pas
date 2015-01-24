program ural1130;
const
  maxn=10000;
  zero=1e-6;
var
  x,y:array[1..maxn]of integer;
  sign:array[1..maxn]of shortint;
  n,i:word;
  l,m:real;
  x0,y0,x1,y1:longint;
begin
  read(n,l);
  for i:=1 to n do begin
    read(x[i],y[i]);sign[i]:=1;
    inc(x0,x[i]);inc(y0,y[i]);
  end;

  m:=2*l*l+zero;i:=0;
  while x0*x0+y0*y0>m do begin
    inc(i);
    if i>n then i:=1;
    x1:=x0-x[i]*sign[i]*2;y1:=y0-y[i]*sign[i]*2;
    if x1*x1+y1*y1>x0*x0+y0*y0+zero then continue;
    sign[i]:=-sign[i];
    x0:=x1;y0:=y1;
  end;

  writeln('YES');
  for i:=1 to n do
    if sign[i]>0 then write('+') else write('-');
  writeln;
end.
