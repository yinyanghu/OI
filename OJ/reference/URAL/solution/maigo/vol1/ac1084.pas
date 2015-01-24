program ural1084;
var
  a,r:byte;
  si,co,angle:real;
begin
  readln(a,r);
  if r>=a/sqrt(2) then
    writeln(sqr(a)*1.0:0:3)
  else if r<=a/2 then
    writeln(pi*sqr(r):0:3)
  else begin
    co:=a/2/r;
    si:=sqrt(1-sqr(co));
    angle:=arctan(si/co);
    writeln((r*si*a/2+(pi/2-angle*2)*sqr(r)/2)*4:0:3);
  end;
end.
