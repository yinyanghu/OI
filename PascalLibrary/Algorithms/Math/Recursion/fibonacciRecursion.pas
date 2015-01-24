program fibonacci;
var n:integer;
function f(n:integer):longint;
 begin
     case n of
         1:f:=0;
         2:f:=1;
         else f:=f(n-1)+f(n-2);
     end;
 end;
begin
    writeln('N=');
    readln(n);
    writeln('f(',n,')=',f(n));
    readln;
end.