program ural1150;
var
  c:array[0..9]of int64;
  n,d,x,y:int64;
  a,i:byte;
begin
  fillchar(c,sizeof(c),0);
  readln(n);

  d:=1;
  repeat
    x:=n div (d*10);
    y:=n mod d;
    a:=n div d mod 10;

    if a=0 then
      inc(c[0],(x-1)*d+y+1)
    else
      inc(c[0],x*d);

    for i:=1 to 9 do
      if i<a then
        inc(c[i],(x+1)*d)
      else if i=a then
        inc(c[i],x*d+y+1)
      else
        inc(c[i],x*d);
    d:=d*10;
  until x=0;

  for i:=0 to 9 do
    writeln(c[i]);
end.
