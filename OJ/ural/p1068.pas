program p1068;
var n:longint;
begin
    readln(n);
    if n>=1 then writeln((n+1)*n div 2)
       else writeln((n+1)*(2-n) div 2);
end.
