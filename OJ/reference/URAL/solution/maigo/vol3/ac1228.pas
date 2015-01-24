program ural1228;
var
  n,i:byte;
  a,b:longint;
begin
  read(n,b);
  for i:=1 to n do begin
    a:=b;
    read(b);
    write(a div b-1);
    if i=n then writeln else write(' ');
  end;
end.
