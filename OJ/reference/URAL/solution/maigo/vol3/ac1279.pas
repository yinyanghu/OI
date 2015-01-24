program ural1279;
const
  max=1000;
var
  count:array[1..max]of longint;
  n,m,k,i,x:longint;
begin
  read(n,m,k);
  for i:=1 to n*m do begin
    read(x);
    inc(count[x]);
  end;

  for i:=1 to max-1 do begin
    if count[i]>k then begin
      writeln(i);
      halt;
    end;
    dec(k,count[i]);
    inc(count[i+1],count[i]);
  end;
  writeln(max+k div count[max]);
end.
