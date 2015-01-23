program p1045;
var a,total:double;
    ans:longint;
begin
    while not eof do begin
        readln(a);
        total:=0; ans:=0;
        if a=0.00 then halt;
        while total<a do begin
            inc(ans);
            total:=total+1/(ans+1);
        end;
        writeln(ans,' card(s)');
    end;
end.
