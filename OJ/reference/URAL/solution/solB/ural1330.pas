var
        c               :       array[0..10001] of longint;
        n,x,y,i,j       :       longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(c[i]);
      inc(c[i],c[i-1]);
    end;
  readln(n);
  for i:=1 to n do
    begin
      readln(x,y);
      if x>y then begin j:=x;x:=y;y:=j;end;
      writeln(c[y]-c[x-1])
    end;
end.