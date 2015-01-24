program ural1234;
const
  zero=1e-9;
var
  a,b,c,d,e:real;
procedure test(a,b:real);
  var
    i:word;
    t:real;
  begin
    for i:=0 to 9000 do begin
      t:=i*pi/18000;
      if (a*sin(t)+b*cos(t)<d) and (b*sin(t)+a*cos(t)<e) then begin
        writeln('YES');
        halt;
      end;
    end;
  end;
begin
  read(a,b,c,d,e);inc(d,zero);inc(e,zero);
  test(a,b);test(a,c);test(b,a);test(b,c);test(c,a);test(c,b);
  writeln('NO');
end.
