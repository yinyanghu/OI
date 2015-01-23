program fetchmod;
const x=120000;
var b,p,k:longint;
    i,j,m,n,s1,s2:longint;
    total,sum:qword;
begin
    assign(input,'mod.in'); reset(input);
    assign(output,'mod.out'); rewrite(output);
    readln(b,p,k);
    if (b=1) and (k=1) then begin
        total:=0;
        writeln(b,'^',p,' mod ',k,'=',total);
        close(input);
        close(output);
        halt;
    end;
    s1:=p mod x;
    s2:=p div x;
    sum:=1;
    for i:=1 to x do begin
        sum:=sum*b;
        if sum>k then sum:=sum mod k;
    end;
    total:=1;
    for i:=1 to s2 do begin
        total:=total*sum;
        if total>k then total:=total mod k;
    end;
    for i:=1 to s1 do begin
        total:=total*b;
        if total>k then total:=total mod k;
    end;
    writeln(b,'^',p,' mod ',k,'=',total);
    close(input);
    close(output);
end.
