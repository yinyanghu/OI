program ural1093;
const
  g=10;
  zero=1e-6;
var
  cx,cy,cz,nx,ny,nz,r,sx,sy,sz,vx,vy,vz,a,b,c,d:real;
procedure check(t:real);
  var
    x,y,z:real;
  begin
    if t<0 then exit;
    x:=sx+vx*t;
    y:=sy+vy*t;
    z:=sz+vz*t-g/2*t*t;
    if sqr(x-cx)+sqr(y-cy)+sqr(z-cz)<r then begin
      writeln('HIT');
      halt;
    end;
  end;
begin
  read(cx,cy,cz,nx,ny,nz,r,sx,sy,sz,vx,vy,vz);
  r:=r*r;
  a:=-g/2*nz;
  b:=nx*vx+ny*vy+nz*vz;
  c:=nx*(sx-cx)+ny*(sy-cy)+nz*(sz-cz);
  if abs(a)<zero then
    check(-c/b)
  else begin
    d:=b*b-4*a*c;
    if d>=0 then begin
      check((sqrt(d)-b)/2/a);
      check((-sqrt(d)-b)/2/a);
    end;
  end;
  writeln('MISSED');
end.
