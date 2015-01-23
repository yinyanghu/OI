program p154;
var n,q,x,y,z:longint;
begin
    readln(q);
    if q=0 then begin
        writeln(1);
        halt;
    end;
    z:=q*4;  y:=0;
    while y<q do begin
        x:=z; y:=0;
        while x>0 do begin
            y:=y+x div 5;
            x:=x div 5;
        end;
        inc(z);
    end;
    if y=q then writeln(z-1)
       else writeln('No solution');
end.
{
var n,q,k,total:longint;
begin
    readln(q);
    if q=0 then begin
        writeln('1');
        halt;
    end;
    total:=0; n:=0;
    while total<=q do begin
        n:=n+5;
        if n mod 5=0 then begin
            k:=n;
            while k mod 5=0 do begin
                inc(total);
                k:=k div 5;
            end;
        end;
        if total=q then begin
            writeln(n);
            halt;
        end;
        if total>q then begin
            writeln('No solution');
            halt;
        end;
    end;
end.}
{    if q>=1000000 then begin
        total:=1000000;
        n:=4000005;
    end;
    if q>=10000000 then begin
        total:=10000000;
        n:=40000010;
    end;
    if q>=50000000 then begin
        total:=50000000;
        n:=200000010;
    end;
    if q=100000000 then begin
        writeln('400000015');
        halt;
    end;}
