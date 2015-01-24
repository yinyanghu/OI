var
        n,i                      :       longint;
        ans,r,x1,y1,x2,y2,sx,sy  :       real;
begin
  readln(n,r);
  ans:=pi*r*2;
  readln(x1,y1);
  sx:=x1;
  sy:=y1;
  for i:=1 to n-1 do
    begin
      readln(x2,y2);
      ans:=ans+sqrt(sqr(x2-x1)+sqr(y2-y1));
      x1:=x2;
      y1:=y2;
    end;
  ans:=ans+sqrt(sqr(x1-sx)+sqr(y1-sy));
  writeln(ans:0:2);
end.
