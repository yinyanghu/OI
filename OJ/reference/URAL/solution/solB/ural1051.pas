var
        m,n,t     :       longint;
begin
  readln(m,n);
  if m>n then
    begin
      t:=m;m:=n;n:=t;
    end;
  if m=1 then writeln((n+1) shr 1)
  else
  if (m mod 3=0) or (n mod 3=0) then writeln(2)
  else writeln(1);
end.