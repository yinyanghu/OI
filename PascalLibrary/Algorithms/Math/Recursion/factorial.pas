program jiecheng;
var t:integer;
    s:extended;
function fac(n:integer):extended;
 begin
     if (n=1) then fac:=1
       else fac:=fac(n-1)*n;
 end;
begin
    writeln('N=');
    read(t);
    if t>1754 then begin
        writeln('Error!');
        halt;
    end;
    s:=fac(t);
    writeln('N!=',s:0:0);
end.
