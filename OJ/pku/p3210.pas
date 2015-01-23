program p3210;
var n:longint;
begin
    readln(n);
    while n<>0 do begin
        if not odd(n) then writeln('No Solution!')
          else writeln(n-1);
        readln(n);
    end;
end.