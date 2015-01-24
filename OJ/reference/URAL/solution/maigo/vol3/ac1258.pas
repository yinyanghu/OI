program ural1258;
var
  w,d,x,y,a,b:extended;
  c:char;
begin
  readln(w,d,x,y,a,b);
  while not eoln do begin
    read(c);
    case c of
      'L':x:=-x;
      'R':x:=w*2-x;
      'F':y:=-y;
      'B':y:=d*2-y;
    end;
  end;
  writeln(sqrt(sqr(x-a)+sqr(y-b)):0:4);
end.
