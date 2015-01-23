program p0011;
var n,i,a,total,p:longint;
begin
    readln(n);
    for i:=1 to n do begin
        readln(a);
        total:=0;
        p:=1;
        while a>=p do begin
            p:=p*5;
            total:=total+a div p;
        end;
        writeln(total);
    end;
end.