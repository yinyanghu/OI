program ural1246;
type
  dot=record
    x,y:extended;
  end;
var
  p,q,a,b,c,ma,mb,mc:dot;
  n,i:longint;
begin
  read(n);
  read(a.x,a.y,b.x,b.y,c.x,c.y);
  p:=a;q:=b;ma:=a;mb:=b;mc:=c;
  for i:=4 to n do begin
    a:=b;b:=c;read(c.x,c.y);
    if b.x>mb.x then begin
      ma:=a;mb:=b;mc:=c;
    end;
  end;

  if p.x>mb.x then begin
    ma:=c;mb:=p;mc:=q;
  end;
  if c.x>mb.x then begin
    ma:=b;mb:=c;mc:=p;
  end;

  p.x:=mb.x-ma.x;p.y:=mb.y-ma.y;
  q.x:=mc.x-mb.x;q.y:=mc.y-mb.y;
  if p.x*q.y>q.x*p.y then writeln('ccw') else writeln('cw');
end.
