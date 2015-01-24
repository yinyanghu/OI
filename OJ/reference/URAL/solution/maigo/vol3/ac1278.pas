program ural1278;
var
  x:array[0..99]of byte;
  k:longint;
  n,i:shortint;
begin
  read(k);
  while k>1 do begin
    if odd(k) then inc(n);
    x[n]:=n+1;inc(n);k:=k shr 1;
  end;
  for i:=0 to n-1 do begin
    write('CALL ');
    if x[i]=0 then writeln(n) else writeln(x[i]);
  end;
  writeln('BELL&RET');
end.
