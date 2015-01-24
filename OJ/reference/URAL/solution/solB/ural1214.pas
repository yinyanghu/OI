var
        a,b     :       longint;
begin
  readln(a,b);
  if (a>0) and (b>0) and odd(a+b)
    then writeln(b,' ',a)
    else writeln(a,' ',b);
end.