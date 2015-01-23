program p1084;
var a,r:longint;
    si,co,angle:double;
begin
    readln(a,r);
    if r>=a/sqrt(2) then begin
        writeln(sqr(a)*1.0:0:3);
        halt;
    end;
    if r<=a/2 then begin
        writeln(pi*sqr(r):0:3);
        halt;
    end;
    co:=a/2/r;
    si:=sqrt(1-sqr(co));
    angle:=arctan(si/co);
    writeln((r*si*a/2+(pi/2-angle*2)*sqr(r)/2)*4:0:3);
end.