program ural1296;
var
  n,i,x,sum,max:longint;
begin
  read(n);
  for i:=1 to n do begin
    read(x);
    inc(sum,x);
    if sum<0 then
      sum:=0
    else
      if sum>max then max:=sum;
  end;
  writeln(max);
end.
