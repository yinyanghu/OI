program erfang;
var s,t:longint;
function fac(n:longint):longint;
 begin
     if (n=0) then fac:=1
       else fac:=fac(n-1)*2;
 end;
begin
    writeln('N=');
    read(t);
    s:=fac(t);
    writeln('N!=',s);
end.
