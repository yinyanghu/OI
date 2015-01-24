var
        n       :       longint;
begin
  readln(n);
  case n of
  1 : writeln('1 2 3');
  2 : writeln('3 4 5');
  else writeln(-1);
  end;
end.