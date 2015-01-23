program p1178;
const p=(1+sqrt(5))/2;
var ans,n:qword;
begin
    readln(n);
    ans:=trunc((n+1)*p)-n-1;
    writeln(ans);
end.
