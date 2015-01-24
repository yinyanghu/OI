program ural1149;
var
  n,i:byte;
procedure a(n:byte);
  var
    i:byte;
  begin
    for i:=1 to n-1 do begin
      write('sin(',i);
      if odd(i) then write('-') else write('+');
    end;
    write('sin(',n);
    for i:=1 to n do
      write(')');
  end;
begin
  readln(n);
  for i:=2 to n do
    write('(');
  for i:=1 to n do begin
    a(i);
    write('+',n+1-i);
    if i<n then write(')');
  end;
  writeln;
end.

