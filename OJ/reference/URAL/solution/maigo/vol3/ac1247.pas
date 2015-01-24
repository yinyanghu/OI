program ural1247;
var
  s,n,i,x,sum:longint;
begin
  read(s,n);
  for i:=1 to s do begin
    read(x);
    inc(sum,x);
    if (sum<i) or (sum>i+n) then begin
      writeln('NO');
      halt;
    end;
  end;
  writeln('YES');
end.
