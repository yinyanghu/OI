program ural1020;
const
  maxn=100;
  zero=1e-6;
var
  x,y:array[1..maxn]of real;
  n,i,j,p:byte;
  r,t:real;
procedure exchange(a,b:byte);
  var
    t:real;
  begin
    t:=x[a];x[a]:=x[b];x[b]:=t;
    t:=y[a];y[a]:=y[b];y[b]:=t;
  end;
function dist(a,b:byte):real;
  begin
    dist:=sqrt(sqr(x[a]-x[b])+sqr(y[a]-y[b]));
  end;
function crosspro(a,b,c:byte):shortint;
  var
    x1,y1,x2,y2,cross:real;
  begin
    x1:=x[b]-x[a];y1:=y[b]-y[a];
    x2:=x[c]-x[a];y2:=y[c]-y[a];
    cross:=x1*y2-x2*y1;
    if abs(cross)<zero then
      crosspro:=0
    else if cross>0 then
      crosspro:=1
    else
      crosspro:=-1;
  end;
begin
  readln(n,r);
  if n=1 then begin
    writeln(2*pi*r:0:2);
    halt;
  end;
  for i:=1 to n do begin
    readln(x[i],y[i]);
    if (y[i]<y[1]) or (y[i]=y[1]) and (x[i]<x[1]) then exchange(1,i);
  end;

  for i:=2 to n-1 do
    for j:=i+1 to n do begin
      t:=crosspro(1,i,j);
      if (t=-1) or (t=0) and (dist(1,i)<dist(1,j)) then
        exchange(i,j);
    end;

  p:=2;
  for i:=3 to n do begin
    if crosspro(1,i,i-1)=0 then continue;
    while crosspro(p-1,p,i)<0 do
      dec(p);
    inc(p);
    x[p]:=x[i];y[p]:=y[i];
  end;
  while crosspro(p-1,p,1)<0 do
    dec(p);

  t:=dist(p,1);
  for i:=2 to p do
    t:=t+dist(i-1,i);
  writeln(t+2*pi*r:0:2);
end.
