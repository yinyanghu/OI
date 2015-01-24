program ural1048;
const
  maxn=1000000;
var
  d:array[1..maxn div 2]of byte;
  n,i,p:longint;
  x,y,f:byte;
begin
  fillchar(d,sizeof(d),0);
  readln(n);
  for i:=n downto 1 do begin
    p:=(i+1) div 2;
    if odd(i) then f:=1 else f:=10;
    read(x);read(y);inc(x,y);
    inc(d[p],x*f);
  end;

  p:=(n+1) div 2;
  for i:=1 to p-1 do
    if d[i]>99 then begin
      dec(d[i],100);
      inc(d[i+1]);
    end;

  for i:=p downto 1 do begin
    if (i<p) or (not odd(n)) then write(d[i] div 10);
    write(d[i] mod 10);
  end;
  writeln;
end.
