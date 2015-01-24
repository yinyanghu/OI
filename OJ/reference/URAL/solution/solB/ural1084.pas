{$i-,s-,r-,q-}
var
        a,r                  :       longint;
        ans,sin,cos,angle    :       real;
begin
  readln(a,r);
  if r>=a/sqrt(2) then
    ans:=sqr(a)*1.0
  else
  if r<=a/2 then
    ans:=pi*sqr(r)
    else
      begin
        a:=a shr 1;
        cos:=a/r;
        sin:=sqrt(1-cos*cos);
        angle:=arctan(sin/cos);
        ans:=(sin*r*a+r*r*(pi/2-angle*2)/2)*4;
      end;
  writeln(ans:0:3);
end.
