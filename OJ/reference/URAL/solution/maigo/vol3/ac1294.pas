program ural1294;
const
  zero=1e-6;
var
  a,b,c,d,x:extended;
begin
  readln(a,b,c,d);
  if abs(a*b-c*d)<zero then begin
    writeln('Impossible.');
    halt;
  end;
  a:=a*1000;b:=b*1000;c:=c*1000;d:=d*1000;
  x:=(a*b*(c*c+d*d)-c*d*(a*a+b*b))/(a*b-c*d);
  if x<-zero then
    writeln('Impossible.')
  else
    writeln('Distance is ',sqrt(x+zero):0:0,' km.');
end.
