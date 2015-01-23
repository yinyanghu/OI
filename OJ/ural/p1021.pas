program p1021;
var a:array[-32768..32767] of boolean;
    n,i,x,y,k:longint;
    ok:boolean;
begin
    readln(n);
    fillchar(a,sizeof(a),false);
    for i:=1 to n do begin
        readln(k);
        a[k]:=true;
    end;
    readln(n);
    ok:=false;
    for i:=1 to n do begin
        readln(x);
        y:=10000-x;
        if (y>=-32768) and (y<=32767) and (a[y]) then begin
            ok:=true;
            break;
        end;
    end;
    if ok then writeln('YES') else writeln('NO');
end.