//Written on 6106 -- Jan 13, 2005
program onp;
var
  t,i:byte;
procedure item;
  var
    c,o:char;
  begin
    read(c);
    if c='(' then begin
      item;
      read(o);
      item;
      write(o);
      read(c);
    end
    else
      write(c);
  end;
begin
  readln(t);
  for i:=1 to t do begin
    item;
    readln;
    writeln;
  end;
end.
