program ural1191;
var
  l,n,k,i:byte;
begin
  readln(l,n);
  for i:=1 to n do begin
    read(k);
    dec(l,l mod k);
    if l=0 then begin
      writeln('YES');
      halt;
    end;
  end;
  writeln('NO');
end.
