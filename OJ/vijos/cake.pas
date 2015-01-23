program cake;
var total:qword;
    n,k:longint;
begin
    readln(n);
    total:=1;
    for k:=1 to n do total:=total+k;
    writeln(total);
end.
