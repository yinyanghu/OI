program ural1134;
const
  maxn=1000;
var
  c:array[0..maxn]of integer;
  n,m,i,x:integer;
procedure no;
  begin
    writeln('NO');
    halt;
  end;
begin
  fillchar(c,sizeof(c),0);
  readln(n,m);
  for i:=1 to m do begin
    read(x);
    inc(c[x]);
  end;

  for i:=1 to n do
    if (c[i-1]=0) and (c[i]=0) then
      inc(m)
    else begin
      if c[i-1]>0 then dec(c[i-1]) else dec(c[i]);
      if c[i-1]>0 then no;
    end;
  if m<>n then no;
  writeln('YES');
end.
