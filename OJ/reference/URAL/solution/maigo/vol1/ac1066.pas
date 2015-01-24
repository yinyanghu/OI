program ural1066;
var
  n,i:integer;
  a,b,c,l,r,h2:real;
  h1:real;
begin
  readln(n,h1);
  l:=0;r:=h1;
  repeat
    b:=h1;
    h2:=(l+r)/2;c:=h2;
    for i:=3 to n do begin
      a:=b;b:=c;c:=2*(b+1)-a;
      if c<0 then break;
    end;
    if c<0 then l:=h2 else r:=h2;
  until (r-l<1e-10) and (c>=0);
  writeln(abs(c):0:2);
end.
