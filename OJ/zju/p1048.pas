program p1048;
var total,ans,a:double;
    i:longint;
begin
    total:=0;
    for i:=1 to 12 do begin
        readln(a);
        total:=total+a;
    end;
    ans:=total/12;
    writeln('$',ans:0:2);
end.
