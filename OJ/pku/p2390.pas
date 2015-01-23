program p2390;
var r,m,y,i:longint;
    ans:double;
begin
    readln(r,m,y);
    ans:=m;
    for i:=1 to y do ans:=ans*(1+r/100);
    writeln(trunc(ans));
end.
