program ural1331;
const
  maxm=5000;
  zero=1e-6;
var
  w,l,x,y,z:array[1..maxm]of real;
  n,m,i,j:word;
  r,ww,ll,xx,yy,zz,ans,t:real;
procedure calcoord(var w,l,x,y,z:real);
  begin
    w:=w*pi/180;
    l:=l*pi/180;
    x:=cos(w)*cos(l);
    y:=cos(w)*sin(l);
    z:=sin(w);
  end;
function arccos(c:real):real;
  begin
    if abs(c)<zero then
      arccos:=pi/2
    else if c>1 then
      arccos:=0
    else if c<-1 then
      arccos:=pi
    else if c>0 then
      arccos:=arctan(sqrt(1-c*c)/c)
    else
      arccos:=pi+arctan(sqrt(1-c*c)/c);
  end;
begin
  read(n,m,r);
  for i:=1 to m do begin
    read(w[i],l[i]);
    calcoord(w[i],l[i],x[i],y[i],z[i]);
  end;

  for i:=1 to n do begin
    read(ww,ll);
    calcoord(ww,ll,xx,yy,zz);
    ans:=-1;
    for j:=1 to m do begin
      t:=xx*x[j]+yy*y[j]+zz*z[j];
      if t>ans then ans:=t;
    end;
    writeln(r*arccos(ans):0:2);
  end;
end.
