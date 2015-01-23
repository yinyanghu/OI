program min;
var n,k:longint;
    s:ansistring;
begin
    readln(s);
    val(copy(s,length(s)-1,2),n,k);
    if (n mod 4=1) or (n mod 4=2) then writeln('1') else writeln('0');
end.
