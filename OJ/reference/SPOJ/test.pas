//Written on 6106 -- Jan 13, 2005
program test;
var
  x:byte;
begin
  repeat
    read(x);
    if x=42 then halt;
    writeln(x);
  until seekeof;
end.
