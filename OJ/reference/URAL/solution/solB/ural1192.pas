const
        pi                =     3.1415926535;

var
        v1,v2,ans,k,a     :       extended;
        v                 :       longint;

begin
  readln(v,a,k);
  a:=a*pi/180;
  v2:=cos(a)*v;
  v1:=sin(a)*v;
  a:=v1*v2/5;
  repeat
    ans:=ans+a;
    a:=a/k;
  until a<1E-10;
  writeln(ans:0:2);
end.