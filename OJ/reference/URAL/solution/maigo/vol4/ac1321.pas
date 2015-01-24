program ural1321;
var
  c:char;
begin
  read(c);
  case c of
    '1':begin
          read(c);
          if c>'1' then write(5+ord(eoln)) else write(7+ord(eoln));
        end;
    '2','3':write(1+ord(eoln));
    else write(3+ord(eoln));
  end;
  while not eoln do begin
    read(c);
    write(ord(eoln));
  end;
  writeln;
end.
