var
        a,b     :       longint;
begin
  read(a,b);
  if not odd(a) and not odd(b) then
    writeln((b-a) shr 1)
  else
    writeln((b-a) shr 1+1);
end.