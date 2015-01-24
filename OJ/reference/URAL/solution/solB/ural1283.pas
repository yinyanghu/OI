var
        a,b,c       :       real;
        ans         :       longint;
begin
  read(a,b,c);
  ans:=0;
  repeat
    if a<=b then break;
    inc(ans);
    a:=a*(1-c/100);
  until false;
  writeln(ans);
end.
