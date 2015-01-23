program p107;
var n,i:longint;
begin
    readln(n);
    if n<9 then writeln('0');
    if n=9 then writeln('8');
    if n>9 then begin
        write('72');
        for i:=1 to n-10 do write('0');
    end;
end.
{
111111111
119357639
380642361
388888889
611111111
619357639
880642361
888888889
}
{var i,j,k,m,n:longint;
    total,p:qword;
    ok:boolean;
begin
    for i:=111111111 to 999999999 do begin
        p:=i;
        total:=p*p;
        m:=0; ok:=true;
        while m<9 do begin
            inc(m);
            k:=total mod 10;
            if k<>m then begin
                ok:=false;
                break;
            end;
            total:=total div 10;
        end;
        if ok then writeln(i);
    end;
end.
}
