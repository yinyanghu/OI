program p1004;
var total,ans,now:extended;
    i:longint;
begin
    total:=0;
    for i:=1 to 12 do begin
        readln(now);
        total:=total+now;
    end;
    ans:=total/12;
    writeln('$',ans:0:2);
end.