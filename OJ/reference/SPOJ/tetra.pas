//Written on 6138 -- Feb 14, 2005
//Copying part of prog PIR
program tetra;
var
  t,i:byte;
  a,b,c,h1,h2,h3,p,q,x,y,z,four_s:extended;
function helen(a,b,c:extended):extended;
  begin
    helen:=sqrt((a+b+c)*(a+b-c)*(a+c-b)*(b+c-a));
  end;
begin
  read(t);
  for i:=1 to t do begin
    read(h3,h2,h1,a,b,c);
    p:=(a*a+b*b-c*c)/(2*a);
    q:=sqrt(b*b-p*p);
    x:=(a*a+h3*h3-h2*h2)/(2*a);
    y:=(b*b-2*p*x+h3*h3-h1*h1)/(2*q);
    z:=sqrt(h3*h3-x*x-y*y);
    four_s:=helen(a,b,c)+helen(h1,h2,c)+helen(h1,b,h3)+helen(a,h2,h3);
    writeln(a*q*z*2/four_s:0:4);
  end;
end.
