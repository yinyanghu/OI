program chinasad;
const m=7654321;
var a:array[1..20000] of qword;
    n,i:longint;
begin
    readln(n);
    a[1]:=1; a[2]:=1;
    for i:= 3 to n do a[i]:=(a[i-1]+a[i-2]) mod m;
    writeln(a[n]);
end.
