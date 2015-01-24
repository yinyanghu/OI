program palouti;
var n:integer;
function f(n:integer):longint;
 begin
     if n=1 then f:=1
       else if n=2 then f:=2
         else if n=3 then f:=4
           else f:=f(n-1)+f(n-2)+f(n-3);
 end;
begin
    writeln('N=');
    readln(n);
    writeln(f(n));
    readln;
end.
