program ural1107;
var
  n,k,c,x,i,j,s:longint;
begin
  readln(n,k);inc(n);
  writeln('YES');
  for i:=1 to k do begin
    read(c);s:=0;
    for j:=1 to c do begin
      read(x);
      inc(s,x);
    end;
    writeln(s mod n+1);
  end;
end.
