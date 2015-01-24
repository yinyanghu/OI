program ural1140;
var
  n,i,t,x,y,z,y1,z1,l1,x2,z2,l2,x3,y3,l3:longint;
  c:char;
procedure out(x,y,z:longint);
  begin
    t:=ord(x<>0)+ord(y<>0)+ord(z<>0);
    writeln(t);
    if x<>0 then writeln('X ',-x);
    if y<>0 then writeln('Y ',-y);
    if z<>0 then writeln('Z ',-z);
  end;
begin
  readln(n);
  x:=0;y:=0;z:=0;
  for i:=1 to n do begin
    readln(c,t);
    case c of
      'X':inc(x,t);
      'Y':inc(y,t);
      'Z':inc(z,t);
    end;
  end;

  y1:=y+x;z1:=z-x;l1:=abs(y1)+abs(z1);
  x2:=x+y;z2:=z+y;l2:=abs(x2)+abs(z2);
  x3:=x-z;y3:=y+z;l3:=abs(x3)+abs(y3);
  if (l1<l2) and (l1<l3) then
    out(0,y1,z1)
  else if l2<l3 then
    out(x2,0,z2)
  else
    out(x3,y3,0);
end.

