//Although high-precision may work well,
//something called Fermat Great Theorem helps.
program ural1349;
var
  n:byte;
begin
  read(n);
  case n of
    1:writeln('1 2 3');
    2:writeln('3 4 5');
    else writeln(-1);
  end;
end.
