program ural1192;
const
  g=10;
  pi=3.1415926535;
var
  v:longint;
  a:byte;
  k:real;
begin
  readln(v,a,k);
  writeln(v*v*sin(a*pi/90)/g/(1-1/k):0:2);
end.
