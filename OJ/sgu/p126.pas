program p126;
var a,b,i,j,k,total,p,s:longint;
begin
    readln(a,b);
    if (a=0) or (b=0) then begin
        writeln('0');
        halt;
    end;
    total:=0;
    while not false do begin
        if a>b then begin
            a:=a-b;
            b:=b*2;
            inc(total);
        end;
        if a<b then begin
            b:=b-a;
            a:=a*2;
            inc(total);
        end;
        if a=b then begin
            inc(total);
            writeln(total);
            halt;
        end;
        if total>1500000 then begin
            writeln('-1');
            halt;
        end;
    end;
end.
