program loj_0185;
var total:extended;
    i,k,n:longint;
    ok:boolean;
begin
    readln(n);
    if n=1 then begin
        writeln('3');
        writeln('1');
        writeln('2');
        writeln('3');
        halt;
    end;
    if n=3 then begin
        writeln('2');
        writeln('5');
        writeln('6');
        halt;
    end;
    k:=0; total:=0; i:=1; ok:=false;
    while true do begin
        inc(i);
        total:=total+ln(i)/ln(10);
        if trunc(total)=n-1 then begin
            writeln('1');
            writeln(i);
            ok:=true;
        end;
        if trunc(total)>=n-1 then break;
    end;
    if ok=false then writeln('NO');
end.