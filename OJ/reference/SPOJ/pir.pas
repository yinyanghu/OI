//Written on 6119 -- Jan 26, 2005
program pir;
var
  t,i:longint;
  a,b,c,h1,h2,h3,p,q,x,y,z:extended;
begin
  read(t);
  for i:=1 to t do begin
    read(h3,h2,h1,a,b,c);
    p:=(a*a+b*b-c*c)/(2*a);
    q:=sqrt(b*b-p*p);
    x:=(a*a+h3*h3-h2*h2)/(2*a);
    y:=(b*b-2*p*x+h3*h3-h1*h1)/(2*q);
    z:=sqrt(h3*h3-x*x-y*y);
    writeln(a*q*z/6:0:4);
  end;
end.
