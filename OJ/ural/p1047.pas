program p1047;
var n,i:longint;
    a0,an,c,sumc,sumb:double;
begin
    read(n,a0,an);
    sumc:=0; sumb:=0;
    for i:=1 to n do begin
        read(c);
        sumc:=sumc+c;
        sumb:=sumb+sumc;
    end;
    writeln((n*a0+an-2*sumb)/(n+1):0:2);
end.